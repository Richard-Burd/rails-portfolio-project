class ApplicationController < ActionController::Base

  # Prevent CRSF attacks by raising an exception
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    # session[:user_id]                                                         <= GENERATION ONE
    # Now that I'm using this line in the "current_user" method below:
    # @current_user ||= User.find_by(session[:user_id])
    # All I have to do is make sure there is a current user present
    !!current_user
  end

  def current_user
    # If you do it like this, you will be firing SQL every time you call this method.
    # User.find_by(session[:user_id])                                           <= GENERATION ONE

    # Now, the first time I call this method, "@current_user" will be assigned
    # the "User.find_by(session[:user_id])" value, and the program will not have
    # to fire SQL again.
    # @current_user ||= User.find_by(session[:user_id])

    # Now that we've defined logged_in? as "!!current_user" we need to add an if statement:
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Methods you build in controllers do not permeate to
  # the ActionView part of your code...
  # You cannot call this in your html.erb unless you say explicitly That
  # this is a "helper_method" - at which
  helper_method :current_user
end
