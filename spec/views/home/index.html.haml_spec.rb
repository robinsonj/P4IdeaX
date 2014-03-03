require 'spec_helper'

describe "home/index.html.haml" do
  it "renders home/index" do
    render
    expect(view).to render_template("home/index")
  end
end
