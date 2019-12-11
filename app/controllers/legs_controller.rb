# NOTE: the Legs are built at a lower level of abstraction for learning purposes.
#       the Trips & Vehicles are built at the higher level of abstraction
#       Legs do not utilize the "resources" method in ./config/routes
#       Legs require no user authenticity or login to edit.
class LegsController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each pags
  # and is located here: app/views/layouts/convoyapp.html.erb
  layout "convoyapp"

  def new
    # render :plain => "This is where you will create a new leg"
    @leg = Leg.new
  end

  def index
    # render :plain => "This is where you will see all the legs"
    @legs = Leg.all
  end

  def show
    # render :plain => "This is where you will see an individual leg"
    @leg = Leg.find(params[:id])
  end

  def edit
    @leg = Leg.find(params[:id])
  end

  def update
    raise params.inspect # right now I can't even get this to fire because for
    # some reason, I cannot get the edit form to route the user to this update action.
    
    @leg.update(description: params[:leg][:description])
    if @leg.valid? # e.g. it meets the validation requirements set in the object model
      @leg.save
      redirect_to legs_path
    else
      render :edit
    end
  end
end
