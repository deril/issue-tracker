class SessionsController < ApplicationController
  respond_to :html, :json

  def new
  end

  def create
    manager = Manager.find_by(email: params[:session][:email].downcase)
    if manager && manager.authenticate(params[:session][:password])
      sign_in manager
      respond_with status: :authorized, location: unassigned_ops_tickets_url do |format|
        format.html { redirect_to unassigned_ops_tickets_url }
      end
    else
      flash.now[:error] = 'Invalid email/password combination'
      respond_with status: :unathorized do |format|
        format.html { render 'new' }
      end
    end
  end

  def destroy
    sign_out
    respond_with location: root_url
  end
end
