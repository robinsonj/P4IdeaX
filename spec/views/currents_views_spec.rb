require 'spec_helper'

describe "CurrentsViews" do

  describe "currents/edit" do
    before(:each) do
      @current = assign(:current, stub_model(Current))
    end

    it "renders the edit current form" do
      render

      assert_select "form[action=?][method=?]", current_path(@current), "post" do
      end
    end
  end

  describe "currents/index" do
    before(:each) do
      assign(:currents, [
        stub_model(Current),
        stub_model(Current)
      ])
    end

    it "renders a list of currents" do
      render
    end
  end

  describe "currents/new" do
    before(:each) do
      assign(:current, stub_model(Current).as_new_record)
    end

    it "renders new current form" do
      render

      assert_select "form[action=?][method=?]", currents_path, "post" do
      end
    end
  end

  describe "currents/show" do
    before(:each) do
      @current = assign(:current, stub_model(Current))
    end

    it "renders attributes in <p>" do
      render
    end
  end
end
