require 'pry'
class VehiclesController < ApplicationController
  layout "burdlayout"
  before_action :authentication_required #=> This is defined in the application controller because the application controller is an inheretance point

  def index
    # render :plain => "This is where a user's vehicles will be shown"

    @user = User.find(params[:user_id])
    @vehicles = Vehicle.all.where(user_id: params[:user_id])
    render template: 'vehicles/index'
    # This is sorta copied from here:
    # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-10-routes-and-resources/routing-and-nested-resources
    # # app/controllers/posts_controller.rb
    # but it's not working

    #if params[:user_id]
    #  @vehicles = User.find(params[:user_id]).vehicles
    #else
    #  @vehicles = Vehicle.all
    #end

    ############################ LEFT OFF HERE #################################
    # @vehicles = Vehicle.all.where(user_id: current_user.id)
  end

  def show
    # render :plain => "This is where an individual vehicle will be shown"
    @user = User.find(params[:user_id])
    @vehicle = Vehicle.find(params[:id])
    # binding.pry
  end

  def new
    # render :plain => "This is where you will make a new vehicle"
    @trips = Trip.all
    @user = User.find(params[:user_id])
    @vehicle = Vehicle.new
  end
  #@authors = Author.all
  #@post = Post.new(post_params(:title, :content, :author_id))
  def create
    @trips = Trip.all
    # render :plain => "This is where a new vehicle will be saved to the database"
    @user = User.find(params[:user_id])
    @vehicle = Vehicle.new(vehicle_params(:name, :miles_per_gallon, :fuel_on_vehicle, :trip_id))
    @vehicle.user_id = @user.id
    @vehicle.trip_id = params[:trip_id]
    # binding.pry
    # raise params.inspect
    if @vehicle.valid?
      @vehicle.save
      # redirect_to root_path
      redirect_to user_vehicles_path
    else
      render :new
    end
  end

  def edit
    render :plain => "This is where an existing vehicle will be edited"
    # binding.pry
  end

  def destroy
    # render :plain => "This is where you will delete trips"
    @vehicle = Vehicle.find(params[:id])
    if @vehicle.user_id == current_user.id
      @vehicle.destroy
      redirect_to user_vehicles_path
    else
      render :plain => "You shouldn't have permission to delete this trip and you should never see this message!"
    end
  end

  private

  def vehicle_params(*args)
    params.require(:vehicle).permit(*args)
  end
end
