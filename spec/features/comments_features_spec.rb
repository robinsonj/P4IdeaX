require 'spec_helper'

describe "CommentFeatures" do
  before do
    @idea1 = create(:idea)
    @idea2 = create(:idea)
  end

  describe "write comments" do
    it "should write and save new comments" do
      visit idea_path(id: @idea1.id)


    end
  end
end
