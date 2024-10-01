class ApplicationController < ActionController::Base
  before_action :authenticate_user!,:configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the :role parameter for sign up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end

  # Redirect users based on role after sign-in or sign-up
  def after_sign_in_path_for(resource)
    if resource.receptionist?
      patients_path
    elsif resource.doctor?
      doctor_root_path
    else
      root_path
    end
  end

   # Redirect users after logout
   def after_sign_out_path_for(resource_or_scope)
    root_path # Change this to any path you'd like, e.g., root_path
  end
end
