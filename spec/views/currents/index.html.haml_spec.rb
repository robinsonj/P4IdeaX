require 'spec_helper'

describe "currents/index" do
  before(:each) do
    assign(:currents, [
      stub_model(Current),
      stub_model(Current)
    ])
  end

  it "renders a list of currents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
