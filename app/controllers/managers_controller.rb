class ManagersController < ApplicationController
  respond_to :html, :json

  def new
    respond_with @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      sign_in @manager
      respond_with @manager, status: :created, location: unassigned_ops_ticket_path do |format|
        format.html { redirect_to unassigned_ops_ticket_path }
      end
    else
      respond_with @manager.errors, status: :unprocessable_entity do |format|
        format.html { render action: 'new' }
      end
    end
  end

  private
    def manager_params
      params.require(:manager).permit(:name, :email, :password, :password_confirmation)
    end
end
