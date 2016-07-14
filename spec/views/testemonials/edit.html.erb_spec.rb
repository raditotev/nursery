require 'rails_helper'

RSpec.describe "testemonials/edit", type: :view do
  before(:each) do
    @testemonial = assign(:testemonial, Testemonial.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit testemonial form" do
    render

    assert_select "form[action=?][method=?]", testemonial_path(@testemonial), "post" do

      assert_select "input#testemonial_title[name=?]", "testemonial[title]"

      assert_select "textarea#testemonial_description[name=?]", "testemonial[description]"
    end
  end
end
