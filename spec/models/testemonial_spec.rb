require 'rails_helper'

RSpec.describe Testemonial, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end

  it "has valida fatory" do
    expect(build(:testemonial)).to be_valid
  end
end
