class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search, :autocomplete_tag_name]

  autocomplete :tag, :name, full: false

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # POST /ideas
  def create
    @idea         = Idea.new(idea_params)
    @idea.owner   = current_user

    save_associations

    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Your Idea was successfully created.' }
      else
        format.html { render action: 'new', notice: 'Your Idea could not be saved.' }
      end
    end
  end

  # GET /ideas/:id
  def show
    @comments = @idea.comments.visible
    @user_vote ||= Vote.find(@idea.id, current_user.id) \
      if user_signed_in? && Vote.exists?(idea_id: @idea.id, user_id: current_user.id)
  end

  # GET /ideas
  def index
    @ideas = Idea.all
  end

  # GET /ideas/search
  def search
    case search_params
    when 'new'
      @ideas = Idea.where(status: 'new').order(created_at: :desc)
    when 'popular'
      @ideas = Idea.where(status: 'new' || 'discussion').order(rating: :desc)
    when 'coming soon'
      @ideas = Idea.where(status: 'accepted').order(rating: :desc)
    else
      @ideas = Idea.search_ideas(search_params)
    end
  end

  # GET /users/:id/edit
  def edit
    render partial: 'edit'
  end

  # PATCH/PUT /ideas/:id
  # PATCH/PUT /ideas/:id.json
  def update

    save_associations

    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/:id
  # DELETE /ideas/:id.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  private

  def set_idea
    @idea = Idea.friendly.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :current_id)
  end

  def idea_tag_params
    params.require(:idea).permit(tag_names: [])[:tag_names]
  end

  def search_params
    params.require(:search_text)
  end

  def save_associations
    if idea_tag_params
      @idea.tags += Tag.from_string(idea_tag_params)
    end

    if idea_params[:current_id]
      @idea.current_pending = true
    end
  end
end
