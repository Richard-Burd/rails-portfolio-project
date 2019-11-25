class SessionsController < ApplicationController
  # this has the "Home" and "Logout" links at the bottom of each pags
  # and is located here: app/views/layouts/burdlayout.html.erb
  layout "burdlayout"

  def new
    @user = User.new
  end

  def create
    # Login using Omniauth-GitHub
    if auth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth_hash)
      session[:user_id] = user.id

      redirect_to root_path
    else
      # Normal Login with username and password
      user = User.find_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        flash[:notice] = "You must enter a valid email & password"
        redirect_to login_path
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
