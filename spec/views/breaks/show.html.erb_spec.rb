require 'rails_helper'

RSpec.describe "breaks/show", type: :view do
  before(:each) do
    @break = assign(:break, Break.create!(
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
