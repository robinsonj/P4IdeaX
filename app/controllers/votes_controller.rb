class VotesController < ApplicationController

  before_filter :authenticate_user! # Require users to be authenticated for any voting actions.

  def create
    @idea = Idea.find(params[:id])
    @vote = Vote.new(vote_params)

    if @vote.save!
      @idea.add_vote(@vote)
      redirect_to idea_path(@idea), notice: 'Your vote was saved.'
    else
      redirect_to idea_path(@idea), notice: 'Your vote could not be saved.'
    end
  end

  def update
    @idea = Idea.find(params[:id])
    @vote = Vote.find(@idea.id, current_user.id)
    @vote.value = params[:value]

    if @vote.save!
      @idea.change_vote(@vote)
      redirect_to idea_path(@idea), notice: 'Your vote was saved.'
    else
      redirect_to idea_path(@idea), notice: 'Your vote could not be saved.'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @vote = Vote.find(@idea.id, current_user.id)
    @idea.subtract_vote(@vote)

    if @vote.destroy!
      redirect_to idea_path(@idea), notice: 'Your vote was removed.'
    else
      redirect_to idea_path(@idea), notice: 'Your vote could not be removed.'
    end
  end

  private

    def vote_params
      params.require(:id)
      params.require(:value)
      { :idea_id => params[:id], :user_id => current_user.id, :value => params[:value] }
    end
end
