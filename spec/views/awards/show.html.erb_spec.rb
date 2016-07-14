require 'rails_helper'

RSpec.describe "awards/show", type: :view do
  before(:each) do
    @award = assign(:award, Award.create!(
      :title => "Title",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
  end
end
