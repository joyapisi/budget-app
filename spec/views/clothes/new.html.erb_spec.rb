require 'rails_helper'

RSpec.describe "clothes/new", type: :view do
  before(:each) do
    assign(:cloth, Cloth.new(
      name: "MyString",
      user_id: 1,
      group_id: 1,
      author_id: 1,
      amount: "9.99"
    ))
  end

  it "renders new cloth form" do
    render

    assert_select "form[action=?][method=?]", clothes_path, "post" do

      assert_select "input[name=?]", "cloth[name]"

      assert_select "input[name=?]", "cloth[user_id]"

      assert_select "input[name=?]", "cloth[group_id]"

      assert_select "input[name=?]", "cloth[author_id]"

      assert_select "input[name=?]", "cloth[amount]"
    end
  end
end
