require 'rails_helper'

RSpec.describe 'Users', type: :view do
  let(:user) do
    User.create!(
      name: 'First User',
      email: 'firstuser@gmail.com',
      password: 'firstuserpassword123'
    )
  end

  before(:each) do
    assign(:user, user)
    assign(:users, [
             User.create!(
               name: 'Jane Smith',
               email: 'jane@gmail.com',
               password: 'janepassword456'
             ),
             User.create!(
               name: 'Alice Johnson',
               email: 'alice@gmail.com',
               password: 'alicepassword789'
             )
           ])
  end

  context 'users#show' do
    it 'renders attributes in <p>' do
      render
      expect(rendered).to match(/First User/)
      expect(rendered).to match(/firstuser@gmail.com/)
      expect(rendered).to match(/firstuserpassword123/)
    end
  end

  context 'users#new' do
    it 'renders new user form' do
      render

      assert_select 'form[action=?][method=?]', users_path, 'post' do
        assert_select 'input[name=?]', 'user[name]'
        assert_select 'input[name=?]', 'user[email]'
        assert_select 'input[name=?]', 'user[password]'
      end
    end
  end

  context 'users#index' do
    it 'renders a list of users' do
      render
      cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
      assert_select cell_selector, text: Regexp.new('Jane Smith'.to_s), count: 1
      assert_select cell_selector, text: Regexp.new('Alice Johnson'.to_s), count: 1
    end
  end
end
