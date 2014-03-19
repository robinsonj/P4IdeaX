require 'spec_helper'

describe "TagViews" do
  before do
    @tag1 = create(:tag)
    @tag2 = create(:tag)
    @tag3 = create(:tag)
    @tag4 = create(:tag)
    @tag5 = create(:tag)
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
end
