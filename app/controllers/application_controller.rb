class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_header_visibility
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :authenticate_user!
  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :nationality, :language ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :nationality, :language ])
  end

  private

  def after_sign_in_path_for(resource)
    root_path # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  def set_header_visibility
    @header_visible = true
  end

  def set_locale
    if user_signed_in? && current_user.language.present?
      I18n.locale = current_user.language.to_sym
    elsif session[:locale].present?
      I18n.locale = session[:locale].to_sym
    else
      I18n.locale = I18n.default_locale
    end
  end
end
