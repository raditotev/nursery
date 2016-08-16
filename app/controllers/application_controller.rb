class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def fees_terms_and_conditions
    send_file(
      "#{Rails.root}/public/Fees Terms and Conditions.pdf",
      filename: "Fees Terms and Conditions.pdf",
      type: "application/pdf"
    )
  end
end
