class Admin::IdeasController < Admin::AdminController

  before_action :set_idea, only: [:edit, :update, :destroy]

  # GET /admin/ideas/new
  def new
    @idea = Idea.new
  end

  # GET /admin/ideas
  def index
    @ideas = Idea.all
  end

  # POST /admin/ideas
  def create
    @idea = Idea.new(idea_params)

    if idea_tag_params
      @idea.tags += Tag.from_string(idea_tag_params)
    end

    if @idea.save
      redirect_to edit_admin_idea_path(@idea), notice: 'Idea created.'
    end

  end

  # GET /admin/ideas/:id/edit
  def edit

  end

  # PATCH/PUT /admin/ideas/:id
  def update
    if @idea.update(idea_params)
      redirect_to edit_admin_idea_path(@idea), notice: 'Idea updated.'
    end
  end

  # DELETE /admin/ideas/:id
  def destroy
    @idea.destroy
  end

  private

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:owner, :title, :description, :current)
  end

  def idea_tag_params
    params.require(:idea).permit(tag_names: [])[:tag_names]
  end
end
