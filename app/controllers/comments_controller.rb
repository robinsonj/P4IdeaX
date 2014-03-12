class CommentsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Commane.new(params)

    if @comment.save
      redirect_to @comment, notice: 'Your comment has been saved.'
    else
      render action: 'new'
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

end
