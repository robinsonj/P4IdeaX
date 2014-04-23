class TagsController < ApplicationController

  # GET /tags
  def index
    @tags = Tag.all
  end

  # GET /tags/:id
  def show
    @tag = Tag.find(params[:id])
    @ideas = @tag.ideas
  end
end
