require 'rails_helper'

RSpec.describe "awards/index", type: :view do
  before(:each) do
    assign(:awards, [
      Award.create!(
        :title => "Title",
        :description => "MyText"
      ),
      Award.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of awards" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
