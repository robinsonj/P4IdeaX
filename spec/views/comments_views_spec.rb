require 'spec_helper'

describe "CommentsViews" do

  describe "comments/edit.html.haml" do
    it "renders create template" do
      render :template => "comments/edit"
      expect(view).to render_template("comments/edit")
    end
  end

  describe "comments/index.html.haml" do
    it "renders create template" do
      render :template => "comments/index"
      expect(view).to render_template("comments/index")
    end
  end

  describe "comments/new.html.haml" do
    it "renders create template" do
      render :template => "comments/new"
      expect(view).to render_template("comments/new")
    end
  end

  describe "comments/show.html.haml" do
    it "renders create template" do
      author   = create(:user)
      @comment = create(:comment, author_id: author.id)
      render :template => "comments/show"
      expect(view).to render_template("comments/show")
    end
  end
end
