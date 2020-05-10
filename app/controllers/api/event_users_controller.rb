class Api::EventUsersController < ApplicationController
  def index
    @event_users = EventUser.all
    render "index.json.jb"
  end

  def create
    @event_user = EventUser.new(
      event_id: params[:event_id],
      user_id: current_user.id,
      role: params[:role],
    )
    if @event_user.save
      render "show.json.jb"
    else
      render json: { errors: @event_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    event_user = EventUser.find_by(id: params[:id])
    event_user.destroy
    render json: { message: "EventUser successfully destroyed" }
  end
end
