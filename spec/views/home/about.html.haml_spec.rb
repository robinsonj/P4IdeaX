require 'spec_helper'

describe "home/about.html.haml" do
  it "renders home/about" do
    render
    expect(view).to render_template("home/about")
  end
end
