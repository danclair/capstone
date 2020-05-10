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
      image: params[:image],
      user_id: current_user.id,
    )
    if @event.save
      render "show.json.jb"
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.title = params[:title] || @event.title
    @event.description = params[:description] || @event.description
    @event.date = params[:date] || @event.date
    @event.time = params[:time] || @event.time
    @event.location = params[:location] || @event.location
    @event.image = params[:image] || @event.image
    if @event.save
      render "show.json.jb"
    else
      render json: { errors: @event.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    event = Event.find_by(id: params[:id])
    event.destroy
    render json: { message: "Event successfully destroyed" }
  end
end
