class AdminMailer < ApplicationMailer
  default from: 'administration@oaktreedaynursery.com'

  def send_admin_password admin
    @user = admin
    subject = "Your administrator password"
    @url = "http://localhost:3000/admins/sign_in?admin[email]=#{@user.email}"

    mail(to: @user.email, subject: subject)
  end

  def send_parent_password parent
    @user = parent
    subject = "Your Oaktree Password"
    @url = "http://localhost:3000/parents/sign_in?parent[email]=#{@user.email}"

    mail(to: @user.email, subject: subject)
  end
end
