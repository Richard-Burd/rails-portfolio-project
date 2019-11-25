class TripsController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each pags
  # and is located here: app/views/layouts/burdlayout.html.erb
  layout "burdlayout"

  # the user must be "logged_in? = true" as defined in this inheretance point:
  # app/controllers/application_controller.rb
  before_action :authentication_required

  def index
    # render :plain => "This is where you will see all the trips"
  end

  def show
    # render :plain => "This is where you will see a trip"
  end

  def new
    # render :plain => "This is where you will view a new trip form"
  end

  def create
    # render :plain => "This is where you will create a trip"
  end

  def edit
    # render :plain => "This is where you will edit trips"
  end

  def update
    render :plain => "This is where you will update trips"
  end

  def destroy
    render :plain => "This is where you will delete trips"
  end

  private

  def vehicle_params(*args)
    params.require(:vehicle).permit(*args)
  end
end
