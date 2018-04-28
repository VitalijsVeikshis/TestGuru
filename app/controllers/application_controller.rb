class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  private

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      stored_location_for(:user) || root_path
    end
  end

  def default_url_options
    # I18n.default_locale ? {} : { lang: I18n.locale }
    { lang: I18n.locale }
  end

  def set_locale
    I18n.locale = locale_available? ? params[:lang] : I18n.default_locale

    redirect_to new_lang_url if params[:set_lang]
  end

  def locale_available?
    I18n.locale_available?(params[:lang])
  end

  def new_lang_url
    request.params.merge(lang: params[:set_lang]).except(:set_lang)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name])
  end
end
