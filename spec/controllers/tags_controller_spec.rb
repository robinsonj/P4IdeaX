require 'spec_helper'

describe TagsController do
  describe "GET 'index'" do
    it "should render 'index' template" do
      get 'index'
      expect(response).to render_template('index')
    end
  end
end