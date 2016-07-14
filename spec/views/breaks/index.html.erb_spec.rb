require 'rails_helper'

RSpec.describe "breaks/index", type: :view do
  before(:each) do
    assign(:breaks, [
      Break.create!(
        :description => "MyText"
      ),
      Break.create!(
        :description => "MyText"
      )
    ])
  end

  it "renders a list of breaks" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
