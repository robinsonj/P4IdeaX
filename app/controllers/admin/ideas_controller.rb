class Admin::IdeasController < Admin::AdminController

  before_action :set_idea, only: [:edit, :update, :destroy]
  before_action :set_idea_assoc, only: [:index, :edit]

  # GET /admin/ideas
  def index
    @idea = Idea.new
    @ideas = Idea.all.order(id: :desc)
  end

  # POST /admin/ideas
  def create
    @idea = Idea.new(idea_params)

    if idea_tag_params
      @idea.tags = Tag.from_string(idea_tag_params)
    end

    if @idea.save
      redirect_to edit_admin_idea_path(@idea), notice: 'Idea was successfully created.'
    else
      render action: 'index', error: 'Idea could not be created.'
    end
  end

  # GET /admin/ideas/:id/edit
  def edit
  end

  # PATCH/PUT /admin/ideas/:id
  def update
    if idea_tag_params
      @idea.tags = Tag.from_string(idea_tag_params)
    end

    if @idea.update(idea_params)
      redirect_to edit_admin_idea_path(@idea), notice: 'Idea was successfully updated.'
    else
      render action: 'edit', error: 'Idea could not updated.'
    end
  end

  # DELETE /admin/ideas/:id
  def destroy
    if @idea.destroy
      redirect_to admin_ideas_path, notice: 'Idea deleted.'
    else
      redirect_to admin_ideas_path, notice: 'Idea could not be deleted.'
    end
  end

  private

  def set_idea
    @idea = Idea.friendly.find(params[:id])
  end

  def set_idea_assoc
    @users = User.all.order(name: :desc).map{ |user| [user.name, user.id] }
    @currents = Current.all.order(title: :desc).map{ |current| [current.title, current.id] }
    @states = Idea.states
  end

  def idea_params
    params.require(:idea).permit(:owner_id, :title, :description, :current, :status)
  end

  def idea_tag_params
    params.require(:idea).permit(tag_names: [])[:tag_names]
  end
end
