class PublicMailer < ApplicationMailer
  default from: 'website@oaktreedaynursery.com'

  def contact_form message
    @sender = message["from"]
    @content = message["content"]
    @subject = message["subject"]

    mail(to: "raditotev@gmail.com", subject: "[website] #{@subject}")
  end

  def request_viewing request
    @name = request["name"]
    @email = request["email"]
    @mobile = request["mobile"] == "" ? "not specified" : request["mobile"]
    @telephone = request["telephone"] == "" ? "not specified" : request["telephone"]
    @date = request["date"]
    @time = request["time"]

    mail(to: "raditotev@gmail.com", subject: "Request for Viewing from #{@name}")
  end
end
