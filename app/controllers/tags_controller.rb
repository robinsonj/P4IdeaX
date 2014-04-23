class TagsController < ApplicationController

  # GET /tags
  def index
    @tags = Tag.all
  end

  end
end
