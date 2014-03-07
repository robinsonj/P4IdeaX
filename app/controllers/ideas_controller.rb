class IdeasController < ApplicationController

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # POST /ideas
  def create
    @idea = Idea.new(idea_params)
  end

  # GET /ideas/1
  def show
  end

  def index
  end

  # GET /users/1/edit
  def edit
    render :partial => 'edit'
  end

  def update

  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description)
    end
end
