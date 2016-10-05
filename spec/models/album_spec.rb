require 'rails_helper'

RSpec.describe Album, type: :model do

  it { is_expected.to validate_presence_of(:name) }

  it "has valid factories" do
    expect(build(:album)).to be_valid
    expect(build(:album_with_photo)).to be_valid
  end
end
