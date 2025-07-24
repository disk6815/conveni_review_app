class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_header_visibility
  before_action :store_locale_before_logout, if: -> { controller_name == 'sessions' && action_name == 'destroy' }
  before_action :store_user_locale_to_session, unless: -> { controller_name == 'sessions' && action_name == 'destroy' }
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  

  def store_locale_before_logout
    Rails.logger.debug "[Locale] Before logout - setting locale to: #{current_user&.language}"
    session[:locale] = current_user.language if current_user&.language.present?
    I18n.locale = current_user.language.to_sym if current_user&.language.present?
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :nationality, :language ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :nationality, :language ])
  end

  private

  def set_header_visibility
    @header_visible = true
  end

  def store_user_locale_to_session # このメソッドは、ユーザーがログインしている場合に、そのユーザーの言語設定をセッションに保存します。
    session[:locale] = current_user.language if user_signed_in? && current_user.language.present?
  end

  def set_locale
    I18n.locale =
      if user_signed_in? && current_user.language.present?
        session[:locale] = current_user.language
        current_user.language.to_sym
      elsif session[:locale].present?
        session[:locale].to_sym
      else
        I18n.default_locale
      end
  end

  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = I18n.t('devise.sessions.signed_out')
    puts (session[:locale].to_s + 'ログアウト後のsession')
    puts (I18n.locale.to_s + 'ログアウト後のI18n.locale') 
    root_path
  end

  def after_sign_in_path_for(resource)
    if resource.respond_to?(:language) && resource.language.present?
      session[:locale] = resource.language
      I18n.locale = resource.language.to_sym
    end

    flash[:notice] = I18n.t('devise.sessions.signed_in') # ログイン後のメッセージ

    puts session[:locale] # Debugging
    puts (I18n.locale.to_s + 'サイン後のI18n.locale')

    root_path
  end
end
