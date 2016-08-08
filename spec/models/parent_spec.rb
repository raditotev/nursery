require 'rails_helper'

RSpec.describe Parent, type: :model do

  subject { build(:parent) }

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
  end

  it "has valida fatory" do
    expect(subject).to be_valid
  end

  describe "callback" do

    it "#set_password generates password via" do
      expect(subject.password).to be_nil
      expect(subject.generated_password).to be_nil
      subject.run_callbacks :validation
      expect(subject.password).not_to be_nil
      expect(subject.generated_password).not_to be_nil
    end

    it "send_email sends an email" do
      expect{ create(:parent) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
