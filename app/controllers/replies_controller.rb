class RepliesController < ApplicationController

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @reply = @ticket.replies.create(replay_params)
    redirect_to ticket_url(@ticket), notice: 'Reply was successfully added.'
  end

  private
    def replay_params
      params.require(:reply).permit(:body, :manager_id)
    end
end
