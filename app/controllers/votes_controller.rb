class VotesController < ApplicationController

  def create

  end

  def update

  end

  def destroy

  end

  private

    def vote_params
      params.require(:idea).permit(:user_id, :idea_id, :value)
    end
end
