class ApplicationController < ActionController::Base

  # Prevent CRSF attacks by raising an exception
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authentication_required
    if !logged_in? # that is, if you are NOT logged in.
      redirect_to login_path
    end
  end

  # Only the authentication_required method above should use this logged_in? method.
  # Object controllers should call the current_user method as shown in the
  # index action of the site controller in: app/controllers/site_controller.rb
  def logged_in?
    # if you are not-not-the current user, that means you ARE the current user.
    !!current_user
  end

  def current_user # https://www.youtube.com/watch?v=gB7lYvfL4J4 (1:13:20 / 1:22:29)
    # In this arrangement, you will call "current_user" 6 or 7 times in a request cycle
    # Now if you were to define 'current_user' like this:
    # User.find(session[:user_id])
    # ...you would be firing SQL each time and that would slow down your app...
    # ...therefore, you want to do something like this:
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # The first time I fire up the app, the "@current_user" will be nil, so it will
    # "at-or" [...||=...] to "User.find(session[:user_id])" instead.  This way,
    # once it has a current_user, it will not query the database again.
    # BUT! it will only do this if ther is a "session[:user_id]" because otherwise,
    # if you're logged out and the value is nil, the program will throw an error
    # message.
  end

  # Methods you build in controllers do not permeate to the ActionView part of
  # your code... that is, you cannot call this in your html.erb unless you say
  # explicitly That this is a "helper_method"
  # reference: https://www.youtube.com/watch?v=gB7lYvfL4J4 (1:12:20 / 1:22:29)
  helper_method :current_user
end
