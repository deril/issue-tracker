class ManagersController < ApplicationController
  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      sign_in @manager
      redirect_to unassigned_op_ticket_path
    else
      render 'new'
    end
  end

  private
    def manager_params
      params.require(:manager).permit(:name, :email, :password, :password_confirmation)
    end
end
