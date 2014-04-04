require 'spec_helper'

describe "VoteViews" do
  describe "votes/_vote.html.haml" do
    it "rendersvotes/vote" do
      render :partial => "votes/vote"
      expect(rendered).to render_template(:partial => "_vote")
    end
  end
end
