class IdeasController < ApplicationController

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # POST /ideas
  def create
    @idea = Idea.new(idea_params)

    if params[:idea][:tag_names]
      @idea.tags += Tag.from_string(params[:idea][:tag_names])
    end

    @idea.save
    redirect_to idea_path(@idea.id)
  end

  # GET /ideas/1
  def show
    @idea = Idea.find(params[:id])

    respond_to do |format|
      format.html
    end
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
      params.require(:idea).permit(:owner_id, :title, :description)
    end
end
