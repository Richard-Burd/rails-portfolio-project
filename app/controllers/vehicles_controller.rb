require 'pry'
class VehiclesController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each pags
  # and is located here: app/views/layouts/burdlayout.html.erb
  layout "burdlayout"

  # the user must be "logged_in? = true" as defined in this inheretance point:
  # app/controllers/application_controller.rb
  before_action :authentication_required

  def index
    # render :plain => "This is where you will see all the vehicles"
    # NOTE: no verification happens here, if you URL hack, you will be
    # able to view other user's vehicles
    @user = User.find(params[:user_id])
    @vehicles = Vehicle.all.where(user_id: params[:user_id])
    render template: 'vehicles/index'
  end

  def show
    # render :plain => "This is where you will see a vehicle"
    # First we must verify that the user owns the vehicle they with to see.
    if current_user.id == params[:user_id].to_i
      @user = User.find(params[:user_id])
      @vehicle = Vehicle.find(params[:id])
    end
  end

  def new
    # NOTE: no verification happens here, if you URL hack, you will be
    # able to view a new vehicle form for another user!
    @trips = Trip.all
    @user = User.find(params[:user_id])
    @vehicle = Vehicle.new
  end

  def create
    # render :plain => "This is where you will create a vehicle"
  end

  def edit
    # render :plain => "This is where you will edit vehicles"
  end

  def update
    render :plain => "This is where you will update vehicles"
  end

  def destroy
    render :plain => "This is where you will delete vehicles"
  end

  private

  def vehicle_params(*args)
    params.require(:vehicle).permit(*args)
  end
end
