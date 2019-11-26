class TripsController < ApplicationController
  # After any user can edit or delete a Trip, we will set conditions so that
  # a user can only edit or delete a trip in which they own a car on.
  before_action :authentication_required #=> This is defined in the application controller because the application controller is an inheretance point

  # this will specify to use the formatting in app/views/layouts/convoyapp.html.erb
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
    render :plain => "This is where you will edit a trip"
  end

  def update
    # render :plain => "This is where you will save updates to edited trips"
    @trip = Trip.find(params[:id])
    @trip.update(trip_params(:name, :start_location, :finish_location, :total_fuel_actually_consumed, :convoy_log))
#     @post = Post.new(title: params[:title], content: params[:content], author_id: params[:author])
# @post = Post.new(post_params(:title, :content, :author)) <=# This isn't working properly yet
    redirect_to trip_path(@trip)
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
    Trip.find(params[:id]).destroy
    redirect_to trips_path
  end

  private

  # Strong Params
  def trip_params(*args)
    params.require(:trip).permit(*args)
  end

end
