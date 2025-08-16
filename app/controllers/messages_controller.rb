class MessagesController < ApplicationController
  before_action :set_chat
  SYSTEM_PROMPT = <<~PROMPT
  You are a helpful AI assistant with memory capabilities.
  Respond naturally to the user and extract factual, specific information for memory storage.

  RULES:
  - Friendly, concise, informative.
  - Personalize using provided memory context.
  - Output must be a single valid JSON object:
    {"response":"<assistant reply>","memories":[{"content":"<fact>","category":"personal_facts|preferences|goals|events|skills|projects|name|friends|family","importance":"high|medium|low","type":"user|session"}]}
  - If no memories: {"response":"<assistant reply>","memories":[]}
  - No text before/after JSON. No markdown.
PROMPT
  def create
    @message = @chat.messages.create!(
      role: "user",
      content: message_params[:content]
    )

    # Get AI response using RubyLLM
    begin
      chat = RubyLLM.chat(model: @chat.model_id || "gpt-4o")

      chat.with_instructions(SYSTEM_PROMPT)
      chat.with_params(response_format: { type: "json_object" })
      chat.on_new_message do
        puts "Assistant is typing..."
      end
      # Add existing messages to context (excluding the current user message)
      existing_messages = @chat.messages.where.not(id: @message.id)

      existing_messages.each do |msg|
        if msg.role == "user"
          # Add user message to context
          chat.instance_variable_get(:@messages) << RubyLLM::Message.new(
            role: "user",
            content: msg.content
          )
        elsif msg.role == "assistant"
          # Add assistant message to context
          chat.instance_variable_get(:@messages) << RubyLLM::Message.new(
            role: "assistant",
            content: msg.content
          )
        end
      end

      # Get AI response
      response = chat.ask(message_params[:content])

      # Save AI response
      ai_message = @chat.messages.create!(
        role: "assistant",
        content: response.content,
        model_id: response.model_id,
        input_tokens: response.input_tokens,
        output_tokens: response.output_tokens
      )

      Rails.logger.info "AI message saved with ID: #{ai_message.id}"
      redirect_to @chat
    rescue => e
      Rails.logger.error "Error in message creation: #{e.class}: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
      @message.destroy
      flash[:error] = "Error getting AI response: #{e.message}"
      redirect_to @chat
    end
  end

  private

  def set_chat
    @chat = Current.user.chats.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
