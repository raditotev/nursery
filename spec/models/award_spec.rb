require 'rails_helper'

RSpec.describe Award, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  it "has valida fatory" do
    expect(build(:award)).to be_valid
  end
end
