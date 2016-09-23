require 'rails_helper'

RSpec.describe Break, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:start_date) }
    it { is_expected.to validate_presence_of(:end_date) }
    it { is_expected.to validate_presence_of(:description) }
  end

  it "has valida fatory" do
    expect(build(:break)).to be_valid
  end
end
