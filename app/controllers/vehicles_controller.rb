class VehiclesController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each page
  # and is located here: app/views/layouts/convoyapp.html.erb
  layout "convoyapp"

  # the user must be "logged_in? = true" as defined in this inheretance point:
  # app/controllers/application_controller.rb
  before_action :authentication_required

  def index
    # NOTE: no verification happens here, if you URL hack, you will be
    # able to view other user's vehicles
    @user = User.find(params[:user_id])
    # @vehicles = Vehicle.all.where(user_id: params[:user_id]) <- not necessary.
    @highest_mpg = current_user.vehicles.highest_mpg
    render template: 'vehicles/index'
  end

  def show
    @user = User.find(params[:user_id])
    # First we must verify that the user owns the vehicle they with to see.
    if current_user.id == params[:user_id].to_i
      @vehicle = Vehicle.find(params[:id])
    else # If the user doesn't own this vehicle, they are sent to the homepage
      render :plain => "Please see #{@user.username} for details on this vehicle"
    end
  end

  def new
    # NOTE: no verification happens here, if you URL hack, you will be
    # able to view a new vehicle form for another user, but when you create
    # a vehicle there, it will still be owned by you (the current_user)
    @trips = Trip.all
    @user = User.find(params[:user_id])
    @vehicle = Vehicle.new
  end

  def create
    # NOTE: no verification happens here, if you URL hack, you will be
    # able to view a new vehicle form for another user, but when you create
    # a vehicle there, it will still be owned by you (the current_user)

    # The following statements were refactored out during my portfolio review with Lantz.
    # they are here for reference only
    # @trips = Trip.all
    # @user = User.find(params[:user_id])
    # @vehicle = Vehicle.new(vehicle_params(:name, :miles_per_gallon, :fuel_on_vehicle, :trip_id))
    # @vehicle.user_id = @user.id

    @vehicle = current_user.vehicles.build(vehicle_params(:name, :miles_per_gallon, :fuel_on_vehicle, :trip_id))
    # NOTE: in this particular example, the update and create actions both modify the same
    # 4 vehicle parameters (name, miles_per_gallon, fuel_on_vehicle, and trip_id)
    # yet the strong params in this (vehicles) controller are setup for a situation in which
    # the update and create actions would have DIFFERENT parameters you want the user to be
    # able to alter, not the same ones.  This is done for illustration purposes only, that is,
    # to show the different options available in this one rails-archetypal-workspace.  The Trip
    # controller does use the alternate formatting for when your update and create actions DO
    # have the same user-malleable parameters.
    
    # for whatever reason, it isn't carrying the trip_id over and I have to specify it here.
    @vehicle.trip_id = params[:trip_id]
    if @vehicle.valid? # e.g. it meets the validation requirements set in the object model
      @vehicle.save
      redirect_to user_vehicles_path
    else
      render :new # this will render with the error messages
    end
  end

  def edit
    # First we must verify that the user owns the vehicle they wish to edit.
    if current_user.id == params[:user_id].to_i
      # If the user owns this vehicle, the following data will be provided:
      @vehicle = Vehicle.find(params[:id])
      @user = User.find(params[:user_id])
      @trips = Trip.all
    else # If the user doesn't own this vehicle, they are trying to URL hack.
      render :plain => "Hey, stop trying to URL hack me!"
    end
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    # The current user can only send a PATCH request if they own the vehicle
    if current_user.id == params[:user_id].to_i
      # upon verification the vehicle will update with the strong params:
      @vehicle.update(vehicle_params(:name, :miles_per_gallon, :fuel_on_vehicle, :trip_id))
      # NOTE: in this particular example, the update and create actions both modify the same
      # 4 vehicle parameters (name, miles_per_gallon, fuel_on_vehicle, and trip_id)
      # yet the strong params in this (vehicles) controller are setup for a situation in which
      # the update and create actions would have DIFFERENT parameters you want the user to be
      # able to alter, not the same ones.  This is done for illustration purposes only, that is,
      # to show the different options available in this one rails-archetypal-workspace.  The Trip
      # controller does use the alternate formatting for when your update and create actions DO
      # have the same user-malleable parameters.

      if @vehicle.valid? # e.g. it meets the validation requirements set in the object model
        @vehicle.save
        redirect_to user_vehicles_path
      else
        render :edit # this will render with the error messages
      end
    else
      render :plain => "You do not belong here, but it's impressive that you URL hacked in this far!"
    end
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
