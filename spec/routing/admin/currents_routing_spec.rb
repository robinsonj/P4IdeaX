require "spec_helper"

describe Admin::CurrentsController do
  describe "routing" do

    it "routes to #index" do
      expect(get: '/admin/currents').to route_to('admin/currents#index')
    end

    it "routes to #new" do
      expect(get: '/admin/currents/new').not_to be_routable
    end

    it "routes to #show" do
      expect(get: '/admin/currents/1').not_to be_routable
    end

    it "routes to #edit" do
      expect(get: '/admin/currents/1/edit').to route_to('admin/currents#edit', :id => '1')
    end

    it "routes to #create" do
      expect(post: '/admin/currents').to route_to('admin/currents#create')
    end

    it "routes to #update" do
      expect(put: '/admin/currents/1').to route_to('admin/currents#update', :id => '1')
    end

    it "routes to #destroy" do
      expect(delete: '/admin/currents/1').to route_to('admin/currents#destroy', :id => '1')
    end

  end
end
