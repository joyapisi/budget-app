require 'rails_helper'
require 'faker'

RSpec.describe 'Groups', type: :request do
  describe 'Groups #index' do
    before(:each) do
      @joy = User.create!(name: Faker::Name.unique.name,
                          email: Faker::Internet.email,
                          password: 'joy123', password_confirmation: 'joy123')
      @group = Group.create(name: 'New Group', icon: 'icon', user: @joy)
    end

    it 'should render the landing page' do
      get '/landing_page'
      expect(response).to have_http_status(200)
    end

    describe 'logged in users ability' do
      before(:each) do
        sign_in @joy
        get '/landing_page'
      end

      it 'should render the Groups page' do
        expect(response).to have_http_status(302)
        expect(response.body).to include('You are being')
      end

      it 'should render the group names' do
        get group_path(@group)
        expect(response.body).to include('You are being')
      end

      it 'should render the add new group buttons' do
        expect(response.body).to include('You are being')
      end

      it 'should render the new group page' do
        get new_group_path
        expect(response).to have_http_status(302)
        expect(response.body).to include('You are being')
      end

      it 'should render the Group Detail page' do
        get group_path(@group)
        expect(response).to have_http_status(302)
        expect(response.body).to include('You are being')
      end
    end
  end
end
