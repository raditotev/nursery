class PublicMailer < ApplicationMailer
  default from: 'website@oaktreedaynursery.com'

  def contact_form message
    @sender = message['from']
    @content = message['content']

    mail(to: "to@example.org", subject: "[website] #{message['subject']}")
  end
end
