class Api::VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
    if params[:owner]
      @vehicles = @vehicles.where(user_id: current_user.id)
    end
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

  def update
    @vehicle = Vehicle.find_by(id: params[:id])
    @vehicle.nickname = params[:nickname] || @vehicle.nickname
    @vehicle.make_id = params[:make_id] || @vehicle.make_id
    @vehicle.vehicle_model_id = params[:vehicle_model_id] || @vehicle.vehicle_model_id
    @vehicle.year = params[:year] || @vehicle.year
    @vehicle.owner = params[:owner] || @vehicle.owner
    @vehicle.color = params[:color] || @vehicle.color
    @vehicle.trim_id = params[:trim_id] || @vehicle.trim_id
    if @vehicle.save
      render "show.json.jb"
    else
      render json: { errors: @vehicle.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    vehicle = Vehicle.find_by(id: params[:id])
    vehicle.destroy
    render json: { message: "Vehicle successfully destroyed" }
  end
end
