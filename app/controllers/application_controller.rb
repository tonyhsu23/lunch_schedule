class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    message =
      t('devise.sessions.signed_in') +
      t('devise.sessions.welcome') +
      current_user.full_name

    flash['notice'] = message
    dashboard_index_path
  end
end
