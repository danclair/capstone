class Api::VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
    render "index.json.jb"
  end

  def create
    @vehicle = Vehicle.new(
      nickname: params[:nickname],
      make_id: params[:make_id],
      vehicle_model_id: params[:vehicle_model_id],
      year: params[:year],
      owner: params[:owner],
      color: params[:color],
      trim_id: params[:trim_id],
      user_id: params[:user_id],
    )
    if @vehicle.save
      render "show.json.jb"
    else
      render json: { errors: @vehicle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @vehicle = Vehicle.find_by(id: params[:id])
    render "show.json.jb"
  end
end
