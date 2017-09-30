class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin
    raise ActiveRecord::RecordNotFound unless current_user.admin?
  end
end
