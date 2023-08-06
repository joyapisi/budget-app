require 'rails_helper'

RSpec.describe "entities/new", type: :view do
  before(:each) do
    assign(:entity, Entity.new(
      name: "MyString",
      user_id: 1,
      group_id: 1,
      author_id: 1,
      amount: "9.99"
    ))
  end

  it "renders new entity form" do
    render

    assert_select "form[action=?][method=?]", entities_path, "post" do

      assert_select "input[name=?]", "entity[name]"

      assert_select "input[name=?]", "entity[user_id]"

      assert_select "input[name=?]", "entity[group_id]"

      assert_select "input[name=?]", "entity[author_id]"

      assert_select "input[name=?]", "entity[amount]"
    end
  end
end
