require 'rails_helper'

RSpec.describe 'Clothes Views', type: :feature do
  before(:each) do
    @cloth = Cloth.create!(
      name: 'MyString',
      user_id: 1,
      group_id: 1,
      author_id: 1,
      amount: '9.99'
    )

    @clothes = [
      Cloth.create!(
        name: 'Name',
        user_id: 2,
        group_id: 3,
        author_id: 4,
        amount: '9.99'
      ),
      Cloth.create!(
        name: 'Name',
        user_id: 2,
        group_id: 3,
        author_id: 4,
        amount: '9.99'
      )
    ]

    @groups = [
      Group.new(id: 1, name: 'Group 1'),
      Group.new(id: 2, name: 'Group 2')
    ]
  end

  context 'show' do
    it 'renders attributes in <div>' do
      visit cloth_path(@cloth)
      expect(page).to have_content('MyString')
      expect(page).to have_content('9.99')
    end
  end

  context 'new' do
    it 'renders new cloth form' do
      visit new_group_cloth_path(group_id: @group_id)
      expect(page).to have_selector('form[action="/group/clothes"][method="post"]')
      expect(page).to have_field('Name', type: 'text')
      expect(page).to have_field('Amount', type: 'text')
      expect(page).to have_select('Group', options: ['Select a Group', 'Group 1', 'Group 2'])
    end
  end

  context 'index' do
    it 'renders a list of clothes' do
      visit group_clothes_path
      expect(page).to have_selector('div.container', count: 2)
      expect(page).to have_selector('div.container-left', text: 'Name', count: 2)
      expect(page).to have_selector('div.container-right', text: '9.99', count: 2)
    end
  end
end
