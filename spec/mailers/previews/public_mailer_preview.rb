# Preview all emails at http://localhost:3000/rails/mailers/public_mailer
class PublicMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/public_mailer/contact_form
  def contact_form
    PublicMailerMailer.contact_form
  end

end
