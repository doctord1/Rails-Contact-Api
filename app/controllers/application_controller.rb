class ApplicationController < ActionController::Base
  before_action :initialize_user

  # Check if the user is already logged in
  def is_logged_in?
    @current_user.is_a?(User)
  end

  protected
   # setup user info on each page
  def initialize_user
    @current_user = User.find_by_id(session[:user_id]) if session[:user_id]
  end

  private
  def enforce_login
    unless session[:user_id] != nil
      redirect_to login_path, :notice => 'You must be logged in to continue'
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
