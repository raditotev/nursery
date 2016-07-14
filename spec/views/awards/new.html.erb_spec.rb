require 'rails_helper'

RSpec.describe "awards/new", type: :view do
  before(:each) do
    assign(:award, Award.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new award form" do
    render

    assert_select "form[action=?][method=?]", awards_path, "post" do

      assert_select "input#award_title[name=?]", "award[title]"

      assert_select "textarea#award_description[name=?]", "award[description]"
    end
  end
end
