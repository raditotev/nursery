class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    resource.class == Admin ? admin_dashboard_path : gallery_path
  end

  def fees_terms_and_conditions
    send_file(
      "#{Rails.root}/public/Fees Terms and Conditions.pdf",
      filename: "Fees Terms and Conditions.pdf",
      type: "application/pdf"
    )
  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "devise"
    else
      "application"
    end
  end
end
