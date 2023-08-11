require 'rails_helper'
require 'faker'

RSpec.describe ClothesController, type: :request do
  describe 'GET #new' do
    before(:each) do
      @joy = User.create!(name: Faker::Name.unique.name,
                          email: Faker::Internet.email,
                          password: 'joy123', password_confirmation: 'joy123')
      @group = Group.create(name: 'Group', icon: 'anicon', user: @joy)
    end

    it 'renders the new page' do
      sign_in @joy  

      valid_cloth_attributes = {
        name: 'New Cloth',
        amount: 50,
        group_id: @group.id,
        user_id: @joy.id
      }

      post group_clothes_path(group_id: @group.id), params: { cloth: valid_cloth_attributes }

      expect(response).to have_http_status(302)
    end
  end
end
