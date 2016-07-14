require 'rails_helper'

RSpec.describe "breaks/new", type: :view do
  before(:each) do
    assign(:break, Break.new(
      :description => "MyText"
    ))
  end

  it "renders new break form" do
    render

    assert_select "form[action=?][method=?]", breaks_path, "post" do

      assert_select "textarea#break_description[name=?]", "break[description]"
    end
  end
end
