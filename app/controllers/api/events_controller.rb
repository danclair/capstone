class Api::EventsController < ApplicationController
  def index
    @events = Event.all
    render "index.json.jb"
  end

  def create
    @event = Event.new(
      title: params[:title],
      description: params[:description],
      date: params[:date],
      time: params[:time],
      location: params[:location],
      # user_id: current_user,
    )
    if @event.save
      render "show.json.jb"
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
