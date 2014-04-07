require 'spec_helper'

describe "currents/edit" do
  before(:each) do
    @current = assign(:current, stub_model(Current))
  end

  it "renders the edit current form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", current_path(@current), "post" do
    end
  end
end
