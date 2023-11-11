module Authentication
  module DeviseHelper
    protected

    def configure_permitted_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
  end
end
