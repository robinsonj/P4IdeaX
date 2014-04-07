require 'spec_helper'

describe "currents/show" do
  before(:each) do
    @current = assign(:current, stub_model(Current))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
