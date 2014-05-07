class TagsController < ApplicationController

  before_action :set_tag, only: [:show]

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/:id
  def show
    @ideas = @tag.ideas
  end
end
