require 'rails_helper'

RSpec.describe Newsletter, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:url) }
  end

  it "has valida fatory" do
    expect(build(:newsletter)).to be_valid
  end
end
