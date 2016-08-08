require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe "send_admin_ password" do

    let(:admin) { create(:admin) }
    let(:mail) { AdminMailer.send_admin_password(admin) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your administrator password")
      expect(mail.to).to eq([admin.email])
      expect(mail.from).to eq(["admin@oaktreedaynursery.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match admin.username
      expect(mail.body.encoded).to match admin.generated_password
    end
  end

  describe "send_parent_ password" do
    let(:parent) { create(:parent) }
    let(:mail) { AdminMailer.send_parent_password(parent) }

    it "renders the headers" do
      expect(mail.subject).to eq("Your Oaktree Password")
      expect(mail.to).to eq([parent.email])
      expect(mail.from).to eq(["admin@oaktreedaynursery.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match parent.email
      expect(mail.body.encoded).to match parent.generated_password
    end
  end
end
