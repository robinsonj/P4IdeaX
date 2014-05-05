class VotesController < ApplicationController

  before_action :set_idea
  before_action :set_vote, only: [:update, :destroy]
  before_filter :authenticate_user! # Require users to be authenticated for any voting actions.

  def create
    @vote = Vote.new(vote_params)

    if @vote.save!
      @idea.add_vote(@vote)
      redirect_to idea_path(@idea), notice: 'Your vote was saved.'
    else
      redirect_to idea_path(@idea), notice: 'Your vote could not be saved.'
    end
  end

  def update
    @vote.update(vote_params)

    if @vote.save!
      @idea.change_vote(@vote)
      redirect_to idea_path(@idea), notice: 'Your vote was saved.'
    else
      redirect_to idea_path(@idea), notice: 'Your vote could not be saved.'
    end
  end

  def destroy
    @idea.subtract_vote(@vote)

    if @vote.destroy!
      redirect_to idea_path(@idea), notice: 'Your vote was removed.'
    else
      redirect_to idea_path(@idea), notice: 'Your vote could not be removed.'
    end
  end

  private

    def set_idea
      @idea = Idea.friendly.find(params[:id])
    end

    def set_vote
      @vote = Vote.find(@idea.id, current_user.id)
    end

    def vote_params
      params.require(:id)
      params.require(:value)
      { :idea_id => Idea.friendly.find(params[:id]).id, :user_id => current_user.id, :value => params[:value] }
    end
end
