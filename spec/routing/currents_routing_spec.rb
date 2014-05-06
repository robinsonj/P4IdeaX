require 'spec_helper'

describe CurrentsController do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/currents').to route_to('currents#index')
    end

    it 'routes to #new' do
      expect(get: '/currents/new').to route_to('currents#new')
    end

    it 'routes to #show' do
      expect(get: '/currents/1').to route_to('currents#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/currents/1/edit').to route_to('currents#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/currents').to route_to('currents#create')
    end

    it 'routes to #update' do
      expect(patch: '/currents/1').to route_to('currents#update', id: '1')
    end

    it 'routes to #update' do
      expect(put: '/currents/1').to route_to('currents#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/currents/1').to route_to('currents#destroy', id: '1')
    end

  end
end
