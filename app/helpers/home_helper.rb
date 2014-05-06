module HomeHelper
  def recent_ideas(max = 5)
    @ideas = Idea.where(status: 'new').order(created_at: :desc).first(max)
  end

  def popular_ideas(max = 5)
    @ideas = Idea.where(status: 'new' || 'discussion').order(rating: :desc).first(max)
  end

  def accepted_ideas(max = 5)
    @ideas = Idea.where(status: 'accepted').order(updated_at: :desc).first(max)
  end
end
