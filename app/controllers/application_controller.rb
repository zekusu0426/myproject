class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate, if: :require_auth_controller?

  REQUIRE_AUTH_CONTROLLERS = [BoxesController, SitesController, TopController]

  def require_auth_controller?
    REQUIRE_AUTH_CONTROLLERS.include?(self.class)
  end

  def authenticate
    redirect_to(new_admin_user_session_path) unless admin_user_signed_in?
  end
end
