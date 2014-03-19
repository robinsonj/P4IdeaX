require 'spec_helper'

describe "TagsRouting" do
  describe "GET 'new'" do
    it "doesn't return http success" do
      expect(:get => 'new').not_to be_routable
    end
  end

  describe "GET 'edit'" do
    it "doesn't return http success" do
      expect(:get => 'edit').not_to be_routable
    end
  end

  describe "GET 'show'" do
    it "doesn't return http success" do
      expect(:get => 'show').not_to be_routable
    end
  end
end
