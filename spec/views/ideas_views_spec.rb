require 'spec_helper'

describe "IdeaViews" do

  before(:each) do
    @user = create(:user)
    @user.confirm!
    sign_in @user
  end

  describe "ideas/index.html.haml" do
    it "renders ideas/index" do
      render :template => "ideas/index"
      expect(rendered).to render_template("ideas/index")
    end
  end

  describe "ideas/new.html.haml" do
    it "renders ideas/new" do
      render :template => "ideas/new"
      expect(rendered).to render_template("ideas/new")
      expect(rendered).to render_template(:partial => "_new")
      expect(rendered).to include "Remember, please keep it constructive!"
    end
  end

  describe "ideas/show.html.haml" do
    it "renders ideas/show" do
      @idea = create(:idea)
      render :template => "ideas/show"
      expect(rendered).to render_template("ideas/show")
    end
  end

  describe "ideas/_new.html.haml" do
    it "renders ideas/_new" do
      render :partial => "ideas/new"
      expect(rendered).to render_template(:partial => "_new")
      expect(rendered).to include "Remember, please keep it constructive!"
    end
  end
end
