class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def sign_in_required
      redirect_to new_member_session_path unless member_signed_in?
    end
  # before_action :authenticate, if: :require_auth_controller?

  # REQUIRE_AUTH_CONTROLLERS = [TopController, RsslistController, ActionController::Base]

  # def require_auth_controller?
  #   REQUIRE_AUTH_CONTROLLERS.include?(self.class)
  # end

  # def authenticate
  #   # ログインしていない場合ログインフォームにリダイレクト
  #   redirect_to(new_member_session_path) unless member_signed_in? || admin_user_signed_in?
  # end
end
