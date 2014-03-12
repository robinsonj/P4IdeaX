require 'spec_helper'

describe "CommentsViews" do
  describe "comments/create.html.haml" do
    it "renders create template" do
      render :template => "comments/create"
      expect(view).to render_template("comments/create")
    end
  end

  describe "comments/edit.html.haml" do
    it "renders create template" do
      render :template => "comments/edit"
      expect(view).to render_template("comments/edit")
    end  end

  describe "comments/index.html.haml" do
    it "renders create template" do
      render :template => "comments/index"
      expect(view).to render_template("comments/index")
    end  end

  describe "comments/new.html.haml" do
    it "renders create template" do
      render :template => "comments/new"
      expect(view).to render_template("comments/new")
    end  end

  describe "comments/show.html.haml" do
    it "renders create template" do
      render :template => "comments/show"
      expect(view).to render_template("comments/show")
    end  end
end
