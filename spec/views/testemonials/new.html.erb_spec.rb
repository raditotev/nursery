require 'rails_helper'

RSpec.describe "testemonials/new", type: :view do
  before(:each) do
    assign(:testemonial, Testemonial.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new testemonial form" do
    render

    assert_select "form[action=?][method=?]", testemonials_path, "post" do

      assert_select "input#testemonial_title[name=?]", "testemonial[title]"

      assert_select "textarea#testemonial_description[name=?]", "testemonial[description]"
    end
  end
end
