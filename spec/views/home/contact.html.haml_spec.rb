require 'spec_helper'

describe "home/contact.html.haml" do
  it "renders home/contact" do
    render
    expect(view).to render_template("home/contact")
  end
end
