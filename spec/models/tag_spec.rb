require 'spec_helper'

describe Tag do
  describe "New Tags" do

    before do
      @tag1 = create(:tag, name: 'test1')
      @tag2 = create(:tag, name: 'test2')
    end

    it "should create new unique tags" do
      expect(@tag1).to be_valid
      expect(@tag2).to be_valid
    end

    it "should not allow duplicate tags" do
      tagdup = @tag1.dup

      expect(tagdup).not_to be_valid
    end

    it "should ignore name case" do
      taglower = build(:tag, name: @tag2.name.downcase)
      tagupper = build(:tag, name: @tag2.name.upcase)

      expect(taglower).not_to be_valid
      expect(tagupper).not_to be_valid
    end
  end
end
