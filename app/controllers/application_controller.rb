class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :search_product

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == '' && password == ''
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :introduction])
  end

  def search_product
    @q = Food.ransack(params[:q])
  end
  
end