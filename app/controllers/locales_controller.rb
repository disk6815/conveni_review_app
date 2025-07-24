class LocalesController < ApplicationController
  skip_before_action :authenticate_user!

  def switch
    session[:locale] = params[:locale]
    redirect_back fallback_location: root_path
  end
end
