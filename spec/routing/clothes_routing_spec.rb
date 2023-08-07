require 'rails_helper'

RSpec.describe ClothesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/clothes').to route_to('clothes#index')
    end

    it 'routes to #new' do
      expect(get: '/clothes/new').to route_to('clothes#new')
    end

    it 'routes to #show' do
      expect(get: '/clothes/1').to route_to('clothes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/clothes/1/edit').to route_to('clothes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/clothes').to route_to('clothes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/clothes/1').to route_to('clothes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/clothes/1').to route_to('clothes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/clothes/1').to route_to('clothes#destroy', id: '1')
    end
  end
end
