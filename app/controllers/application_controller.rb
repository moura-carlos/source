class ApplicationController < ActionController::Base
  # making sure I can use current_user both in controllers and views
  # make current_user available to views
  helper_method :current_user, :is_logged_in?
  # making sure that before any action is executed in the whole application I exectue the current_user method.
  # run this on every single page and action
  before_action :current_user

  def current_user
    # check if the session for the user id is present (user is logged in)
    if is_logged_in?
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end

    # returning the @current_user variable
    @current_user
  end

  def is_logged_in?
    session[:user_id].present?
  end
end
