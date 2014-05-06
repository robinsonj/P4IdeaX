class CommentsController < ApplicationController

  before_action :set_comment, :only => [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  # GET /ideas/:idea_id/comments/new
  def new
    @comment = Comment.new
  end

  # POST /ideas/:idea_id/comments
  def create
    @idea = Idea.friendly.find(params[:idea_id])
    @comment = Comment.new(comment_params)
    @comment.idea = @idea
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to idea_path(@idea), notice: 'Your comment has been saved.'
    else
      redirect_to idea_path(@idea), notice: 'Your comment could not be saved.'
    end
  end

  # GET /ideas/:idea_id/comments/:id
  def show
  end

  # GET /ideas/:idea_id/comments/:id/edit
  def edit
  end

  # PATCH /ideas/:idea_id/comments/:id
  # PUT   /ideas/:idea_id/comments/:id
  def update

    if @comment.update(comment_params)
      redirect_to @comment.idea, notice: 'Your comment was successfully updated.'
    else
      redirect_to @comment.idea, notice: 'Your comment was not successfully updated.'
    end
  end

  # DELETE /ideas/:idea_id/comments/:id
  def destroy
    @idea = @comment.idea

    if @comment.destroy
      redirect_to idea_path(@idea), notice: 'Your comment was successfully removed.'
    else
      redirect_to idea_path(@idea), notice: 'Your comment could not be removed.'
    end

  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end
