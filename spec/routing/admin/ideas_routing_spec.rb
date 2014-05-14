require "spec_helper"

describe Admin::IdeasController do
  describe "routing" do

    it "routes to #index" do
      expect(get: '/admin/ideas').to route_to('admin/ideas#index')
    end

    it "routes to #new" do
      expect(get: '/admin/ideas/new').not_to be_routable
    end

    it "routes to #show" do
      expect(get: '/admin/ideas/1').not_to be_routable
    end

    it "routes to #edit" do
      expect(get: '/admin/ideas/1/edit').to route_to('admin/ideas#edit', :id => '1')
    end

    it "routes to #create" do
      expect(post: '/admin/ideas').to route_to('admin/ideas#create')
    end

    it "routes to #update" do
      expect(put: '/admin/ideas/1').to route_to('admin/ideas#update', :id => '1')
    end

    it "routes to #destroy" do
      expect(delete: '/admin/ideas/1').to route_to('admin/ideas#destroy', :id => '1')
    end

  end
end
