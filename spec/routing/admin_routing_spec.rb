require 'spec_helper'

describe 'Admin Routing' do
  describe Admin::DashboardController do
    it "routes to #index" do
      expect(get: '/admin').to route_to('admin/dashboard#index')
    end
  end
end
