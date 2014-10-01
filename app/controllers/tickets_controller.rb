class TicketsController < ApplicationController
  respond_to :html, :json
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    respond_with @tickets = Ticket.all
  end

  def show
    respond_with @ticket
  end

  def new
    @ticket = Ticket.new
    @ticket.build_customer
    @ticket.status_id = Status::WAIT_FOR_STAFF
    respond_with @ticket
  end

  def edit
    respond_with @ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      respond_with @ticket, status: :created, location: @ticket do |format|
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
      end
    else
      respond_with @ticket.errors, status: :unprocessable_entity do |format|
        format.html { render action: 'new' }
      end
    end
  end

  def update
    if @ticket.update(ticket_params)
      respond_with @ticket, location: @ticket do |format|
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
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

    def ticket_params
      params.require(:ticket).permit(:department_id,  :status_id, :subject, :body, customer_attributes: [:email, :name])
    end
end
