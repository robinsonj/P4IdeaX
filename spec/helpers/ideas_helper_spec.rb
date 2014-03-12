require 'spec_helper'

describe IdeasHelper do
  describe "idea_objects_list" do
    it "fetches all ideas" do
      idea1 = create(:idea, id: 1)
      idea2 = create(:idea, id: 2)
      idea3 = create(:idea, id: 3)
      idea4 = build(:idea, id: 4)
      idea5 = create(:idea, id: 5)

      helper.idea_objects_list.should include idea1
      helper.idea_objects_list.should include idea2
      helper.idea_objects_list.should include idea3
      helper.idea_objects_list.should_not include idea4
      helper.idea_objects_list.should include idea5
    end

    it "should return an array (empty)" do
      expect(helper.idea_objects_list).to eq([])
    end

    it "should return an array (not empty)" do
      idea1 = create(:idea)
      idea2 = create(:idea)

      expect(helper.idea_objects_list).to match_array([idea1, idea2])
      expect(helper.idea_objects_list).to match_array([idea2, idea1])
    end
  end
end
