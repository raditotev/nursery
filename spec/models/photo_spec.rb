require 'rails_helper'

RSpec.describe Photo, type: :model do

  it { should belong_to :imageable }


  it "has valida factory" do
    expect(build(:album_photo)).to be_valid
  end
end
