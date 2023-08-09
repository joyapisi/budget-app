require 'rails_helper'

RSpec.describe 'clothes/edit', type: :view do
  let(:cloth) do
    Cloth.create!(
      name: 'MyString',
      user_id: 1,
      group_id: 1,
      author_id: 1,
      amount: '9.99'
    )
  end

  before(:each) do
    assign(:cloth, cloth)
  end

  it 'renders the edit cloth form' do
    render

    assert_select 'form[action=?][method=?]', cloth_path(cloth), 'post' do
      assert_select 'input[name=?]', 'cloth[name]'

      assert_select 'input[name=?]', 'cloth[user_id]'

      assert_select 'input[name=?]', 'cloth[group_id]'

      assert_select 'input[name=?]', 'cloth[author_id]'

      assert_select 'input[name=?]', 'cloth[amount]'
    end
  end
end
