require 'rails_helper'

RSpec.describe Job, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end

  it "has valida fatory" do
    expect(build(:job)).to be_valid
  end
end
