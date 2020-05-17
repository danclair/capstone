class Api::EventUsersController < ApplicationController
  def index
    @event_users = EventUser.where(user_id: current_user.id)
    render "index.json.jb"
  end

  def create
    @event_user = EventUser.find_or_initialize_by(
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
    if params[:event_id]
      event_user = EventUser.find_by(event_id: params[:event_id], user_id: current_user.id)
    else
      event_user = EventUser.find_by(id: params[:id])
    end
    event_user.destroy
    render json: { message: "EventUser successfully destroyed" }
  end
end
