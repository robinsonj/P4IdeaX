require 'spec_helper'

describe "TagsRouting" do

  describe "GET 'index'" do
    it "should be routable" do
      expect(:get => 'index').to be_routable
    end
  end

  describe "GET 'new'" do
    it "should not be routable" do
      expect(:get => 'new').not_to be_routable
    end
  end

  describe "GET 'edit'" do
    it "should not be routable" do
      expect(:get => 'edit').not_to be_routable
    end
  end

  describe "GET 'show'" do
    it "should not be routable" do
      expect(:get => 'show').not_to be_routable
    end
  end

  describe "PATCH 'update'" do
    it "should not be routable" do
      expect(:patch => 'update').not_to be_routable
    end
  end

  describe "PUT 'update'" do
    it "should not be routable" do
      expect(:put => 'update').not_to be_routable
    end
  end

  describe "DELETE 'destroy'" do
    it "shoudl not be routable" do
      expect(:patch => 'destroy').not_to be_routable
    end
  end
end
