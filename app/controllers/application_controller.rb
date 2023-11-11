class ApplicationController < ActionController::Base
  include Authentication::DeviseHelper

  before_action :configure_permitted_params, if: :devise_controller?
end
