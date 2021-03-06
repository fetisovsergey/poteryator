class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
  end
  
  private 
  def get_location
	@coordinates = Geocoder.search(request.remote_ip).first
	if @coordinates
		@coordinates = @coordinates.coordinates
        else
		@coordinates = [50.064213,37.59521]
        end
  end
end
