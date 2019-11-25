require 'pry'
class VehiclesController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each pags
  # and is located here: app/views/layouts/burdlayout.html.erb
  layout "burdlayout"

  # the user must be "logged_in? = true" as defined in this inheretance point:
  # app/controllers/application_controller.rb
  before_action :authentication_required

  def index
    render :plain => "This is where you will see all the vehicles"
  end

  def show
    render :plain => "This is where you will see a vehicle"
  end

  def new
    render :plain => "This is where you will view a new vehicle form"
  end

  def create
    render :plain => "This is where you will create a vehicle"
  end

  def edit
    render :plain => "This is where you will edit vehicles"
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
