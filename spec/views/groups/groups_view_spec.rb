require 'rails_helper'

RSpec.describe 'Groups Views', type: :feature do
  before(:each) do
    @groups = [
      Group.create!(
        name: 'Name',
        icon: 'Icon',
        user_id: 2
      ),
      Group.create!(
        name: 'Name',
        icon: 'Icon',
        user_id: 2
      )
    ]
  end

  context 'index' do
    it 'renders a list of groups' do
      visit groups_path
      expect(page).to have_selector('div.container', count: 2)
      expect(page).to have_selector('div.container-left', count: 2)
      expect(page).to have_selector('div.container-right', count: 2)
      expect(page).to have_selector('p', text: 'Name', count: 2)
      expect(page).to have_selector('p', text: 'Icon', count: 2)
      expect(page).to have_selector('p', text: '2', count: 2)
    end
  end

  context 'new' do
    it 'renders new group form' do
      visit new_group_path
      expect(page).to have_selector('form[action="/groups"][method="post"]')
      expect(page).to have_field('Name', type: 'text')
      expect(page).to have_field('Icon', type: 'text')
      expect(page).to have_button('Create Group', class: 'new-buttons')
    end
  end

  context 'show' do
    before(:each) do
      @group = Group.create!(
        name: 'Name',
        icon: 'Icon',
        user_id: 2
      )
    end

    it 'renders attributes in <div>' do
      visit group_path(@group)
      expect(page).to have_selector('div.container', count: 1)
      expect(page).to have_selector('div.container-left', count: 1)
      expect(page).to have_selector('div.container-right', count: 1)
      expect(page).to have_selector('p', text: 'Name', count: 1)
      expect(page).to have_selector('p', text: 'Icon', count: 1)
      expect(page).to have_selector('p', text: '2', count: 1)
    end
  end
end
