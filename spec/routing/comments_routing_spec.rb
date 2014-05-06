require 'spec_helper'

describe CommentsController do
  describe 'routing' do
    # it "routes to #edit" do
    #   expect("").to route_to("comments#edit")
    # end

    it 'does not route to #index' do
      expect(get: '/comments').not_to route_to('comments#index')
    end

    it 'routes to #new' do
      expect(get: '/ideas/1/comments/new').to route_to('comments#new', idea_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/ideas/1/comments/1').to route_to('comments#show', idea_id: '1', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/ideas/1/comments/1/edit').to route_to('comments#edit', idea_id: '1', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/ideas/1/comments').to route_to('comments#create', idea_id: '1')
    end

    it 'routes to #update' do
      expect(patch: '/ideas/1/comments/1').to route_to('comments#update', idea_id: '1', id: '1')
    end

    it 'routes to #update' do
      expect(put: '/ideas/1/comments/1').to route_to('comments#update', idea_id: '1', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/ideas/1/comments/1').to route_to('comments#destroy', idea_id: '1', id: '1')
    end

  end
end
