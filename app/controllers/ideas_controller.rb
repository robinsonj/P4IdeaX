class IdeasController < ApplicationController

  autocomplete :tag, :name, :full => false

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # POST /ideas
  def create
    @idea = Idea.new(idea_params)
    @idea.owner = current_user

    if idea_tag_params
      @idea.tags += Tag.from_string(idea_tag_params)
    end

    respond_to do |format|
      if @idea.save
        format.html { redirect_to idea_path(@idea.id), notice: 'Your Idea was successfully created.' }
      else
        if user_signed_in?
          format.html { render action: 'new', notice: 'Your Idea could not be saved.' }
        else
          format.html { redirect_to new_user_session_path, notice: 'Please sign in to create an idea.' }
        end
      end
    end
  end

  # GET /ideas/:id
  def show
    @idea = Idea.find(params[:id])
    @comments = @idea.comments.visible

    @user_vote ||= Vote.find(@idea.id, current_user.id) \
      if user_signed_in? && Vote.exists?(idea_id: @idea.id, user_id: current_user.id)
  end

  # GET   /ideas
  # POST  /ideas/search   # Potentially needs to be moved to another action?
  def index
    if params[:search]
      @ideas = Idea.search_tags(params[:search])
    else
      @ideas = Idea.all
    end

    if params[:page_size]
      page_size = params[:page_size].to_i
      params[:page_size] = 10 if page_size < 10
      params[:page_size] = 50 if page_size > 50
    end

    respond_to do |format|
      format.html
    end
  end

  # GET /users/:id/edit
  def edit
    render :partial => 'edit'
  end

  def update

  end

  private

    def idea_params
      params.require(:idea).permit(:title, :description)
    end

    def idea_tag_params
      params.require(:idea).permit(:tag_names => [])[:tag_names]
    end
end
