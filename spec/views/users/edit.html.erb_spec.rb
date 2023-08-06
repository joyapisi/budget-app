require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      name: "MyString",
      user_id: 1,
      group_id: 1,
      author_id: 1,
      amount: "9.99"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[user_id]"

      assert_select "input[name=?]", "user[group_id]"

      assert_select "input[name=?]", "user[author_id]"

      assert_select "input[name=?]", "user[amount]"
    end
  end
end
