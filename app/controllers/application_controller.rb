class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :basic_auth, :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :encrypted_password, :last_name, :first_name, :kana_last_name, :kana_first_name, :birthdate])
  end

  # def after_sign_in_path_for(resource)
  #   root_path # Replace `root_path` with the path to your desired top page
  # end
end
