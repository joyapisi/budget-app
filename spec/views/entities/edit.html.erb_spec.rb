require 'rails_helper'

RSpec.describe "entities/edit", type: :view do
  let(:entity) {
    Entity.create!(
      name: "MyString",
      user_id: 1,
      group_id: 1,
      author_id: 1,
      amount: "9.99"
    )
  }

  before(:each) do
    assign(:entity, entity)
  end

  it "renders the edit entity form" do
    render

    assert_select "form[action=?][method=?]", entity_path(entity), "post" do

      assert_select "input[name=?]", "entity[name]"

      assert_select "input[name=?]", "entity[user_id]"

      assert_select "input[name=?]", "entity[group_id]"

      assert_select "input[name=?]", "entity[author_id]"

      assert_select "input[name=?]", "entity[amount]"
    end
  end
end
