class UsersController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each page
  # and is located here: app/views/layouts/convoyapp.html.erb
  layout "convoyapp"

  def vehicles_index
    @user = User.find(params[:id])
    @vehicles = Vehicle.all.where(id: user.id)
    render template: 'vehicles/index'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.username = params[:user][:username]
    @user.password = params[:user][:password]
    if @user.valid?
      @user.save
      session[:user_id] = @user.id

      redirect_to root_path
    else
      render :new
    end

  end
end
