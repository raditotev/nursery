class AdminMailer < ApplicationMailer

  def send_admin_password admin
    @user = admin
    subject = "Your administrator password"
    @url = "http://localhost:3000/admins/sign_in?admin[email]=#{@user.email}"

    mail(to: @user.email, subject: subject)
  end
end
