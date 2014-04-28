class CommentsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @comment = Comment.new
  end

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

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  private

    def comment_params
      params.require(:comment).permit(:text)
    end
end
