class Api::EventsController < ApplicationController
  def index
    @events = Event.all
    render "index.json.jb"
  end

  def create
    response = Cloudinary::Uploader.upload(params[:image])
    cloudinary_url = response["secure_url"]
    @event = Event.new(
      title: params[:title],
      description: params[:description],
      date: params[:date],
      time: params[:time],
      location: params[:location],
      image: cloudinary_url,
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
    response = Cloudinary::Uploader.upload(params[:image])
    cloudinary_url = response["secure_url"]
    # GET RID OF ^THAT^ IF CLOUDINARY DOESN'T WORK?
    @event = Event.find_by(id: params[:id], user_id: current_user.id)
    @event.title = params[:title] || @event.title
    @event.description = params[:description] || @event.description
    @event.date = params[:date] || @event.date
    @event.time = params[:time] || @event.time
    @event.location = params[:location] || @event.location
    @event.image = cloudinary_url || @event.image
    # CHANGE ^THIS^ BACK TO params[:image] IF CLOUDINARY DOESN'T WORK OUT
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
