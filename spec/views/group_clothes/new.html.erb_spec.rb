require 'rails_helper'

RSpec.describe "group_clothes/new", type: :view do
  before(:each) do
    assign(:group_cloth, GroupCloth.new(
      cloth: nil,
      group: nil
    ))
  end

  it "renders new group_cloth form" do
    render

    assert_select "form[action=?][method=?]", group_clothes_path, "post" do

      assert_select "input[name=?]", "group_cloth[cloth_id]"

      assert_select "input[name=?]", "group_cloth[group_id]"
    end
  end
end
