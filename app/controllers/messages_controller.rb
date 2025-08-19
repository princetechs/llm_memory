class MessagesController < ApplicationController
  before_action :set_chat
  before_action :set_memory_service
  
  # Memory types for AI categorization
  MEMORY_TYPES = %w[
    name
    personal_facts
    preferences
    goals
    skills
    projects
    events
    friends
    family
    conversation
  ].freeze
  
  # System prompt for AI memory assistant
  SYSTEM_PROMPT = <<~PROMPT.freeze
    You are an AI assistant with memory. Use context naturally. Extract new facts.
    
    OUTPUT: JSON only
    {
      "response": "<reply>",
      "memories": [
        {
          "content": "<fact>",
          "category": "name|personal_facts|preferences|goals|skills|projects|events|friends|family|conversation",
          "importance": "high|medium|low",
          "type": "user|session"
        }
      ]
    }
    
    If no new memories: { "response": "<reply>", "memories": [] }
    
    RULES: Be conversational, reference memories, don't repeat questions, extract facts only.
  PROMPT



  def create
    @message = @chat.messages.create!(role: "user", content: message_params[:content])

    chat = RubyLLM.chat(model: @chat.model_id || "gpt-4o")
                  .with_params(response_format: { type: 'json_object' })

    memories = gather_memories
    chat.with_instructions(build_enhanced_prompt(memories))
    add_existing_messages(chat)

    response = chat.ask(message_params[:content])
    handle_ai_response(response)

    redirect_to @chat
  rescue => e
    Rails.logger.error "Error in message creation: #{e.class}: #{e.message}"
    Rails.logger.error e.backtrace.join("\n")
    @message&.destroy
    flash[:error] = "Error getting AI response: #{e.message}"
    redirect_to @chat
  end

  private

  def set_chat
    @chat = Current.user.chats.find(params[:chat_id])
  end

  def set_memory_service
    @memory_service = MemoryService.new(Current.user)
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def gather_memories
    # Get all available memories for context
    all_memories = @memory_service.get_profile_memories(limit: 10)
    
    # Build conversation summary instead of individual messages
    conversation_summary = build_conversation_summary
    
    # Return memories with conversation context
    {
      memories: all_memories,
      conversation_summary: conversation_summary
    }
  end

  def add_existing_messages(chat)
    # Add conversation summary instead of individual messages (token optimization)
    conversation_summary = build_conversation_summary
    
    if conversation_summary.present?
      chat.instance_variable_get(:@messages) << RubyLLM::Message.new(
        role: "system", 
        content: "Conversation context: #{conversation_summary}"
      )
    end
  end

  def build_conversation_summary
    recent_messages = @chat.messages.where.not(id: @message.id).last(3)
    return "" if recent_messages.blank?
    
    # Convert to hash format for r2lm gem
    messages_hash = recent_messages.map { |msg| { role: msg.role, content: msg.content } }
    
    @memory_service.memory.build_conversation_summary(messages_hash)
  end

  def build_enhanced_prompt(context_data)
    # Use the static system prompt from initializer
    system_prompt = SYSTEM_PROMPT
    
    # Build query-aware memory context using r2lm gem
    memory_context = @memory_service.memory.build_context(
      query: message_params[:content],
      limit: 5
    )
    
    # Build the enhanced prompt
    prompt_parts = [system_prompt]
    
    if memory_context.present?
      prompt_parts << "MEMORY: #{memory_context}"
    end
    
    if context_data[:conversation_summary].present?
      prompt_parts << "CONTEXT: #{context_data[:conversation_summary]}"
    end
    
    prompt_parts.join("\n\n")
  end

  def handle_ai_response(response)
    parsed = JSON.parse(response.content) rescue nil

    if parsed
      save_ai_message(parsed['response'] || response.content, response)
      store_memories_from_response(parsed)
    else
      save_ai_message(response.content, response)
      @memory_service.store_from_conversation(
        "AI response (unparsed): #{response.content.truncate(200)}",
        category: 'conversation',
        importance: 'medium'
      )
    end
  end

  def save_ai_message(content, response)
    @chat.messages.create!(
      role: "assistant",
      content: content,
      model_id: response.model_id,
      input_tokens: response.input_tokens,
      output_tokens: response.output_tokens
    )
  end

  def store_memories_from_response(parsed_response)
    memories = parsed_response['memories'] || []
    Rails.logger.info "Storing #{memories.size} memories from AI response"

    memories.each do |m|
      @memory_service.store(
        m['content'],
        category: m['category'],
        importance: m['importance'] || 'medium'
      )
    end
  end
end
