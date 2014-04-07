require 'spec_helper'

describe "currents/new" do
  before(:each) do
    assign(:current, stub_model(Current).as_new_record)
  end

  it "renders new current form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", currents_path, "post" do
    end
  end
end
