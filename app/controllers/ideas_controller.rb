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
    if params[:page_size]
      page_size = params[:page_size].to_i
      params[:page_size] = 10 if page_size < 10
      params[:page_size] = 50 if page_size > 50
    end

    respond_to do |format|
      format.html
    end
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
