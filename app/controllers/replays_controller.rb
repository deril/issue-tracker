class ReplaysController < ApplicationController
  before_action :set_replay, only: [:show, :edit, :update, :destroy]

  def new
    @replay = Replay.new
  end

  def edit
  end

  def create
    @replay = Replay.new(replay_params)

    if @replay.save
      redirect_to @replay, notice: 'Replay was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @replay.update(replay_params)
      redirect_to @replay, notice: 'Replay was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @replay.destroy
    redirect_to replays_url
  end

  private
    def set_replay
      @replay = Replay.find(params[:id])
    end

    def replay_params
      params.require(:replay).permit(:department_id, :subject, :body, customer_attributes: [:email, :name])
    end
end
