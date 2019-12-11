class TripsController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each pags
  # and is located here: app/views/layouts/convoyapp.html.erb
  layout "convoyapp"

  # the user must be "logged_in? = true" as defined in this inheretance point:
  # app/controllers/application_controller.rb
  before_action :authentication_required

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    # First we must verify that the user owns a vehicle on the trip, otherwise
    # they have no business viewing the edit form for editing the trip.
    if trip_mod_permitted?
      # Once the user is verified to have the correct permissions, they will get the
      # necessary data to render the page:
      @legs = Leg.all
      @vehicles = Vehicle.all
      @trip = Trip.find(params[:id])
    else # If the user is not verified, they get no data and are sent back to the homepage.
      redirect_to root_path
    end
  end

  def update
    # First we must verify that the user owns a vehicle on the trip, otherwise they have
    # no business sending a PATCH request to edit the trip.
    if trip_mod_permitted?
      @vehicles = Vehicle.all
      @trip = Trip.find(params[:id])
      @trip.update(trip_params)
      if @trip.valid? # e.g. it meets the validation requirements set in the object model
        @trip.save
        redirect_to trip_path(@trip)
      else
        render :edit
      end
    else # If the user is not verified, they get no data and are sent back to the homepage.
      redirect_to root_path
    end
  end

  def new
    # render :plain => "This is where you will make a new trip"
    @legs = Leg.all
    @vehicles = Vehicle.all
    @trip = Trip.new
  end

  def create
    # render :plain => "This is where a new trip will be saved to the database"
    @vehicles = Vehicle.all                   # stuff in the params this action must act on
    @trip = Trip.new(trip_params)
    if @trip.valid? # e.g. it meets the validation requirements set in the object model
      @trip.save
      redirect_to trips_path
    else
      render :new # this will render with the error messages
    end
  end

  def destroy
    @trip = Trip.find(params[:id])
    if trip_mod_permitted?
      @trip.destroy
      redirect_to trips_path
    else
      render :plain => "You shouldn't have permission to delete this trip and you should never see this message!"
    end
  end

  private

  # Strong Params
  # In order to implement strong params, go to: config/application.rb and delete this line:
  # config.action_controller.permit_all_parameters = true
  def trip_params
    params.require(:trip).permit(:name, :start_location, :finish_location, :total_fuel_actually_consumed, :convoy_log, leg_ids:[], vehicle_ids:[])
  end

end
