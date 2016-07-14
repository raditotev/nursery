require 'rails_helper'

RSpec.describe "breaks/edit", type: :view do
  before(:each) do
    @break = assign(:break, Break.create!(
      :description => "MyText"
    ))
  end

  it "renders the edit break form" do
    render

    assert_select "form[action=?][method=?]", break_path(@break), "post" do

      assert_select "textarea#break_description[name=?]", "break[description]"
    end
  end
end
