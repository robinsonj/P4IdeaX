require 'spec_helper'

describe "IdeaRequests" do
  before do
    @idea1 = create(:idea)
    @idea2 = create(:idea)
  end

  describe "GET /ideas" do
    it "return http success" do
      get ideas_path
      response.status.should be(200)
    end

    it "shows correct content" do
      get ideas_path
      expect(response).to render_template(:index)
    end
  end

  describe "GET /ideas/new" do
    it "return http success" do
      get new_idea_path
      response.status.should be(200)
    end

    it "shows correct content" do
      get new_idea_path
      expect(response).to render_template(:new)
    end
  end

  describe "GET /ideas/:id/edit" do
    it "return http success" do
      get edit_idea_path(:id => @idea1.id)
      response.status.should be(200)
    end

    it "shows correct content" do
      get edit_idea_path(:id => @idea1.id)
      expect(response).to render_template(:partial => 'ideas/_edit')
    end
  end

  describe "GET /ideas/:id" do
    it "return http success" do
      get idea_path(:id => @idea2.id)
      response.status.should be(200)
    end

    it "shows correct content" do
      get idea_path(:id => @idea2.id)
      expect(response).to render_template(:show)
    end
  end

  pending "needs expanded GET, POST, PATCH, PUT, DESTROY tests"
end
