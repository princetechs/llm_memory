class MessagesController < ApplicationController
  before_action :set_chat

  def create
    @message = @chat.messages.create!(
      role: "user",
      content: message_params[:content]
    )

    # Get AI response using RubyLLM
    begin
      chat = RubyLLM.chat(model: @chat.model_id || "gpt-4o")

      # Add existing messages to context (excluding the current user message)
      @chat.messages.where.not(id: @message.id).each do |msg|
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
      @chat.messages.create!(
        role: "assistant",
        content: response.content,
        model_id: response.model_id,
        input_tokens: response.input_tokens,
        output_tokens: response.output_tokens
      )

      redirect_to @chat
    rescue => e
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
