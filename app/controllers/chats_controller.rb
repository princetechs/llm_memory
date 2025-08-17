class ChatsController < ApplicationController
  before_action :set_chat, only: [ :show, :destroy ]

  def index
    @chats = Current.user.chats.order(created_at: :desc)
  end

  def show
    @messages = @chat.messages.order(created_at: :asc)
    # hi swastika
  end

  def create
    @chat = Current.user.chats.create!(model_id: "gpt-4o")
    redirect_to @chat
  end

  def destroy
    @chat.destroy
    redirect_to chats_path, notice: "Chat deleted successfully"
  end

  private

  def set_chat
    @chat = Current.user.chats.find(params[:id])
  end
end
