class ConversationsController < ApplicationController
  def index
    @page_title = "Conversations Lion Socail"
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    if current_user.role == "admin"
      redirect_to admin_path
    else
      redirect_to conversations_path
    end
  end

  private
    def conversation_params
      params.permit(:sender_id, :receiver_id)
    end
end
