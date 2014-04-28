require 'spec_helper'

describe "TagViews" do
  before(:each) do
    @tag1 = create(:tag, name: "tag1")
    @tag2 = create(:tag, name: "tag2")
    @tag3 = create(:tag, name: "tag3")
    @tag4 = create(:tag, name: "tag4")
    @tag5 = create(:tag, name: "tag5")
  end

  describe "tags/index.html.haml" do
    it "has tag names" do
      render :template => "tags/index.html.haml"

      expect(rendered).to include "Tags"
      expect(rendered).to include @tag1.name
      expect(rendered).to include @tag2.name
      expect(rendered).to include @tag3.name
      expect(rendered).to include @tag4.name
      expect(rendered).to include @tag5.name
    end
  end

  describe "tags/show" do

    it "has tag name" do
      @tag = @tag1
      render :template => "tags/show.html.haml"
      expect(rendered).to include @tag.name
    end

    it "has tag's ideas" do
      @tag = @tag1

      user = create(:user)
      user.confirm!

      assign(:ideas, [
        create(:idea, :title => 'new title', :owner => user),
        create(:idea, :owner => user),
        create(:idea, :owner => user),
        create(:idea, :owner => user)
        ])

      render :template => "tags/show.html.haml"

      expect(rendered).to include 'new title'
    end
  end
end
