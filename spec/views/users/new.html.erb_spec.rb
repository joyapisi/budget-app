require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(:user, User.new(
                    name: 'MyString',
                    user_id: 1,
                    group_id: 1,
                    author_id: 1,
                    amount: '9.99'
                  ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input[name=?]', 'user[name]'

      assert_select 'input[name=?]', 'user[user_id]'

      assert_select 'input[name=?]', 'user[group_id]'

      assert_select 'input[name=?]', 'user[author_id]'

      assert_select 'input[name=?]', 'user[amount]'
    end
  end
end
