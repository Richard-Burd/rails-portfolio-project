class UsersController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each pags
  # and is located here: app/views/layouts/burdlayout.html.erb
  layout "burdlayout"

  # This was all copied from here:
  # https://learn.co/tracks/full-stack-web-development-v8/module-13-rails/section-10-routes-and-resources/routing-and-nested-resources
  # But it's not clear anything does anything as it's not all working yet.
  # Also...watch this video here maybe:
  # https://www.youtube.com/watch?time_continue=47&v=zZn0xWry6TE&feature=emb_logo
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
