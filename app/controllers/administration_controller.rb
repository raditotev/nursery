class AdministrationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "administration"
  before_action :authenticate_admin!

  def after_sign_in_path_for(admin)
   admin_path
  end

end
