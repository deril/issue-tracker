class Ops::TicketsController < ApplicationController
  respond_to :html, :json
  before_action :set_ticket, only: [:show, :update, :edit]
  before_action :signed_in_user

  def index
    respond_with @tickets = Ticket.all
  end

  def unassigned
    respond_with @tickets = Ticket.no_assigned
  end

  def opened
    respond_with @tickets = Ticket.opened
  end

  def closed
    respond_with @tickets = Ticket.closed
  end

  def held
    respond_with @tickets = Ticket.held
  end

  def show
    @replies = @ticket.replies
    respond_with @ticket, @replies
  end

  def edit
    respond_with @ticket
  end

  def update
    if @ticket.update(ticket_params)
      respond_with @ticket, location: @ticket do |format|
        format.html { redirect_to [:ops, @ticket], notice: 'Ticket was successfully updated.' }
      end
    else
      respond_with @ticket.errors, status: :unprocessable_entity do |format|
        format.html { render action: 'edit' }
      end
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
