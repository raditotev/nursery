require 'rails_helper'

RSpec.describe "admins/new", type: :view do
  before(:each) do
    assign(:admin, Admin.new(
      :name => "MyString",
      :email => "MyString",
      :superadmin => false
    ))
  end

  it "renders new admin form" do
    render

    assert_select "form[action=?][method=?]", admins_path, "post" do

      assert_select "input#admin_name[name=?]", "admin[name]"

      assert_select "input#admin_email[name=?]", "admin[email]"

      assert_select "input#admin_superadmin[name=?]", "admin[superadmin]"
    end
  end
end
