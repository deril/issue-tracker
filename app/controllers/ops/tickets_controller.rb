class Ops::TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :update]
  before_action :signed_in_user

  def index
    @tickets = Ticket.all
  end

  def unassigned
    @tickets = Ticket.no_assigned
  end

  def opened
    @tickets = Ticket.opened
  end

  def closed
    @tickets = Ticket.closed
  end

  def holded
    @tickets = Ticket.holded
  end

  def show
    @replies = @ticket.replies
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:ops, @ticket], notice: 'Ticket was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

  def signed_in_user
    redirect_to new_session_url, notice: "Please sign in." unless signed_in?
  end

    def ticket_params
      params.require(:ticket).permit(:subject, :body, :manager_id, :department_id, :status_id)
    end
end
