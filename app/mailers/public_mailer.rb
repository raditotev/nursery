class PublicMailer < ApplicationMailer
  default from: 'website@oaktreedaynursery.com'

  def contact_form message
    @sender = message[:from]
    @content = message[:content]

    mail(to: "office@oaktreedaynursery.com", subject: "[website] #{message[:subject]}")
  end

  def request_viewing request
    @name = request["name"]
    @email = request["email"]
    @mobile = request["mobile"] == "" ? "not specified" : request["mobile"]
    @telephone = request["telephone"] == "" ? "not specified" : request["telephone"]
    @date = request["date"]
    @time = request["time"]

    mail(to: "office@oaktreedaynursery.com", subject: "Request for Viewing from #{@name}")
  end
end
