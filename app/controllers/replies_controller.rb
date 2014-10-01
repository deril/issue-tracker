class RepliesController < ApplicationController
  respond_to :html, :json

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @reply = @ticket.replies.create(replay_params)
    respond_with [@ticket, @reply], status: :created do |format|
      format.html { redirect_to ticket_url(@ticket), notice: 'Reply was successfully added.' }
    end
  end

  private
    def replay_params
      params.require(:reply).permit(:body, :manager_id)
    end
end
