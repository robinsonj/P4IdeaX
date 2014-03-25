require 'spec_helper'

describe "IdeasRouting" do

  describe "GET 'index'" do
    it "should be routable" do
      expect(:get => '/ideas').to be_routable
    end

    it "should route to ideas#index" do
      expect(:get => '/ideas').to route_to(
          :controller => 'ideas',
          :action => 'index'
        )
    end
  end

  describe "POST 'index'" do
    it "should be routable" do
      expect(:post => '/ideas/search').to be_routable
    end

    it "should route to ideas#index" do
      expect(:post => '/ideas/search').to route_to(
          :controller => 'ideas',
          :action => 'index'
        )
    end
  end

  describe "POST 'create'" do
    it "should be routable" do
      expect(:post => '/ideas').to be_routable
    end

    it "should route to ideas#create" do
      expect(:post => '/ideas').to route_to(
          :controller => 'ideas',
          :action => 'create'
        )
    end
  end

  describe "GET 'new'" do
    it "should be routable" do
      expect(:get => '/ideas/new').to be_routable
    end

    it "should route to ideas#new" do
      expect(:get => '/ideas/new').to route_to(
          :controller => 'ideas',
          :action => 'new'
        )
    end
  end

  describe "GET 'edit'" do
    it "should be routable" do
      expect(:get => '/ideas/1/edit').to be_routable
    end

    it "should route to ideas#edit" do
      expect(:get => '/ideas/1/edit').to route_to(
          :controller => 'ideas',
          :action => 'edit',
          :id => '1'
        )
    end
  end

  describe "GET 'show'" do
    it "should be routable" do
      expect(:get => '/ideas/1').to be_routable
    end

    it "should route to ideas#show" do
      expect(:get => '/ideas/1').to route_to(
          :controller => 'ideas',
          :action => 'show',
          :id => '1'
        )
    end
  end

  describe "PATCH 'update'" do
    it "should be routable" do
      expect(:patch => '/ideas/1').to be_routable
    end

    it "should route to ideas#update" do
      expect(:patch => '/ideas/1').to route_to(
          :controller => 'ideas',
          :action => 'update',
          :id => '1'
        )
    end
  end

  describe "PUT 'update'" do
    it "should be routable" do
      expect(:put => '/ideas/1').to be_routable
    end

    it "should route to ideas#update" do
      expect(:put => '/ideas/1').to route_to(
          :controller => 'ideas',
          :action => 'update',
          :id => '1'
        )
    end
  end

  describe "DELETE 'destroy'" do
    it "should be routable" do
      expect(:delete => '/ideas/1').to be_routable
    end

    it "should route to ideas#destroy" do
      expect(:delete => '/ideas/1').to route_to(
          :controller => 'ideas',
          :action => 'destroy',
          :id => '1'
        )
    end
  end
end
