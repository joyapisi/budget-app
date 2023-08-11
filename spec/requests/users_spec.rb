require 'rails_helper'
require 'faker'
require 'devise'

RSpec.describe 'Groups', type: :request do
  describe 'GET /index' do
    before(:each) do
      @joy = User.create!(name: Faker::Name.unique.name,
                          email: Faker::Internet.email,
                          password: 'joy123', password_confirmation: 'joy123')
      @group = Group.create(name: 'New Group', icon: 'icon', user: @joy)
    end

    it 'should render the landing page' do
      get '/landing_page'
      expect(response.status).to eq(200)
    end

    describe 'logged in users ability' do
      before(:each) do
        sign_in @joy
        get '/'
      end

      it 'should render the Groups page' do
        expect(response.status).to eq(302)
        expect(response.body).to include('You are being')
      end

      it 'should render the group names' do
        get group_path(@group.id)
        expect(response.body).to include('You are being')
      end

      it 'should render the add new group buttons' do
        expect(response.body).to include('You are being')
      end

      it 'should render the new group page' do
        get new_group_path
        expect(response.status).to eq(302)
        expect(response.body).to include('You are being')
      end

      it 'should render the Group Detail page' do
        get group_path(@group.id)
        expect(response.status).to eq(302)
        expect(response.body).to include('You are being')
      end
    end
  end
end
