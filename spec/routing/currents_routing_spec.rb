require 'spec_helper'

describe CurrentsController do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/currents').to route_to('currents#index')
    end

    it 'does not route to #new' do
      expect(get: '/currents/new').to route_to('currents#show', id: 'new')
    end

    it 'routes to #show' do
      expect(get: '/currents/1').to route_to('currents#show', id: '1')
    end

    it 'does not route to #edit' do
      expect(get: '/currents/1/edit').not_to be_routable
    end

    it 'does not route to #create' do
      expect(post: '/currents').not_to be_routable
    end

    it 'does not route to #update' do
      expect(patch: '/currents/1').not_to be_routable
    end

    it 'does not route to #update' do
      expect(put: '/currents/1').not_to be_routable
    end

    it 'does not route to #destroy' do
      expect(delete: '/currents/1').not_to be_routable
    end

  end
end
