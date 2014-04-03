class VotesController < ApplicationController

  before_filter :authenticate_user!

  def create
    @idea = Idea.find(params[:id])
    @vote = Vote.new(vote_params)

    if @vote.save!
      @idea.add_vote(@vote)
      flash[:notice] = 'Your vote was saved.'
      render template: 'ideas/show', status: 201
    else
      flash[:notice] = 'Your vote could not be saved.'
      render template: 'ideas/show'
    end
  end

  def update
    @idea = Idea.find(params[:id])
    @vote = Vote.find(@idea.id, current_user.id)
    @vote.value = params[:value]

    if @vote.save!
      @idea.subtract_vote(@vote)
      @idea.add_vote(@vote)
      flash[:notice] = 'Your vote was saved.'
      render template: 'ideas/show'
    else
      flash[:notice] = 'Your vote could not be saved.'
      render template: 'ideas/show'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @vote = Vote.find(@idea.id, current_user.id)
    @idea.subtract_vote(@vote)

    if @vote.destroy!
      flash[:notice] = 'Your vote was removed.'
      render template: 'ideas/show'
    else
      flash[:notice] = 'Your vote could not be removed.'
      render template: 'ideas/show'
    end
  end

  private

    def vote_params
      params.require(:id)
      params.require(:value)
      { :idea_id => params[:id], :user_id => current_user.id, :value => params[:value] }
    end
end
