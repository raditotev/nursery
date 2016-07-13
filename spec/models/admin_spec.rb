require 'rails_helper'

RSpec.describe Admin, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end

  it "has valida fatory" do
    expect(build(:admin)).to be_valid
    expect(build(:super_admin)).to be_valid
  end

end
