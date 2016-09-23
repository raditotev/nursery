class AdministrationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "administration"
  before_action :authenticate_admin!

end
