class RepliesController < ApplicationController
  before_action :set_reply, only: [:edit, :update, :destroy]

  def new
    @reply = Reply.new
  end

  def edit
  end

  def create
    @reply = Reply.new(replay_params)

    if @reply.save
      redirect_to @reply, notice: 'Reply was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @reply.update(replay_params)
      redirect_to @reply, notice: 'Reply was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @reply.destroy
    redirect_to replies_url
  end

  private
    def set_reply
      @reply = Reply.find(params[:id])
    end

    def replay_params
      params.require(:reply).permit(:department_id, :subject, :body, customer_attributes: [:email, :name])
    end
end
