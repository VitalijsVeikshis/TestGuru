class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def after_sign_in_path_for(resource)
    return admin_tests_path if resource.is_a?(Admin)
    stored_location_for(:user) || root_path
  end
end
