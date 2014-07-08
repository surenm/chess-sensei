class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: ['index']

  def get_user
    current_user
  end

  def require_login
    @user = get_user

    if @user.nil?
      redirect_to '/'
    end
  end

  def index
  end
end
