class TagsController < ApplicationController

  def index
    @tags = Tags.all
  end
end
