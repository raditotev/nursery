require 'rails_helper'

RSpec.describe Admin, type: :model do

  subject { build(:admin) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
  end

  it "has valida fatory" do
    expect(subject).to be_valid
    expect(build(:super_admin)).to be_valid
  end

  describe "callbacks" do

    it "generates password via set_password" do
      expect(subject.password).to be_nil
      expect(subject.generated_password).to be_nil
      subject.run_callbacks :validation
      expect(subject.password).not_to be_nil
      expect(subject.generated_password).not_to be_nil
    end

    it "sends an email via send_email" do
      expect{ create(:admin) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end

end
