require 'spec_helper'

describe TagsController do

  describe "GET 'index'" do
    it 'should be routable' do
      expect(get: 'tags/index').to be_routable
    end
  end

  describe "GET 'new'" do
    it 'should not be routable' do
      expect(get: 'tags/new').to route_to('tags#show', id: 'new')
    end
  end

  describe "GET 'edit'" do
    it 'should not be routable' do
      expect(get: 'tags/edit').to route_to('tags#show', id: 'edit')
    end
  end

  describe "GET 'show'" do
    it 'should be routable' do
      expect(get: 'tags/show').to be_routable
    end
  end

  describe "PATCH 'update'" do
    it 'should not be routable' do
      expect(patch: 'tags/update').not_to be_routable
    end
  end

  describe "PUT 'update'" do
    it 'should not be routable' do
      expect(put: 'tags/update').not_to be_routable
    end
  end

  describe "DELETE 'destroy'" do
    it 'shoudl not be routable' do
      expect(patch: 'tags/destroy').not_to be_routable
    end
  end
end
