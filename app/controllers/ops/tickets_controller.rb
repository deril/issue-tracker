class Ops::TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def unassinged
    @tickets = Ticket.no_assigned
  end

  def openned
    @tickets = Ticket.opened
  end

  def closed
    @tickets = Ticket.closed
  end

  def holded
    @tickets = Ticket.holded
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to [:admin, @ticket], notice: 'Ticket was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket], notice: 'Ticket was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:subject, :body)
    end
end
