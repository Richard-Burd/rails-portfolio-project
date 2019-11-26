class TripsController < ApplicationController
  # After any user can edit or delete a Trip, we will set conditions so that
  # a user can only edit or delete a trip in which they own a car on.
  before_action :authentication_required #=> This is defined in the application controller because the application controller is an inheretance point

  # this will specify to use the formatting in app/views/layouts/burdlayout.html.erb
  layout "burdlayout"

  def index
    # render :plain => "You should only see this if you're logged in"
    @trips = Trip.all
  end

  def show
    # render :plain => "This should have a URL like so: localhost:3000/trips/1/show"
    @trip = Trip.find(params[:id])
  end

  def edit
    @legs = Leg.all
    @vehicles = Vehicle.all
    @trip = Trip.find(params[:id])
    # This code fulfills one of the Rails Portfolio project requirements:
    # You must include at least one class level ActiveRecord scope method.
    # Your scope method must be chainable, meaning that you must use ActiveRecord
    # Query methods within it (such as .where and .order) rather than native ruby
    # methods (such as #find_all or #sort) <=# The code below uses "where"
    if @trip.vehicles.where(user_id: current_user.id).exists? == true
      # render :plain => "This is where you will edit a trip called: #{@trip.name}"
    else
      # render :plain => "You shouldn't have permission to edit this trip and you should never see this message!"
      redirect_to trip_path(@trip)
    end
  end

  def update
    @vehicles = Vehicle.all
    @trip = Trip.find(params[:id])

    @trip.update(trip_params)
    # This no longer works because we are using Has Many Through in Forms now
    # @trip.update(trip_params(:name, :start_location, :finish_location, :total_fuel_actually_consumed, :convoy_log, :vehicle_ids))

    # This method isn't working so I cannot add vehicles directly to a trip
    # @trip.update_column(trip_params(:vehicle_ids)) << params[:trip][:vehicle_ids]


# @cust.house_ids << House.find(params[:house_id])

    if @trip.valid?
      @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def new
    render :plain => "This is where you will make a new trip"
  end

  def create
    render :plain => "This is where a new trip will be saved to the database"
  end

  # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-6-validations-and-forms/delete-forms
  def destroy
    # render :plain => "This is where you will delete trips"
    @trip = Trip.find(params[:id])
    if @trip.vehicles.where(user_id: current_user.id).exists? == true
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
  # def trip_params(*args)
  #   params.require(:trip).permit(*args)
  # end
  def trip_params
    params.require(:trip).permit(:name, :start_location, :finish_location, :total_fuel_actually_consumed, :convoy_log, leg_ids:[], vehicle_ids:[])
  end

end
