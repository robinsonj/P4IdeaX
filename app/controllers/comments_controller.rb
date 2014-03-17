class CommentsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.idea_id = params[:idea_id]
    @comment.author_id = current_user.id

    if @comment.save
      redirect_to idea_path(:id => params[:idea_id]), notice: 'Your comment has been saved.'
    else
      redirect_to idea_path(:id => params[:idea_id]), notice: 'Your comment could not be saved.'
    end
  end

  def index
    @comments = Comment.all
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
