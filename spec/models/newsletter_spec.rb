require 'rails_helper'

RSpec.describe Newsletter, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:document) }
  end

  it "has valid factory" do
    expect(build(:newsletter)).to be_valid
  end
end
