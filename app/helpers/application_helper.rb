module ApplicationHelper

  def currents_list
    Current.all.order(title: :desc).map{ |current| [current.title, current.id] }
  end

  def pending_ideas_count
    Idea.where(current_pending: true).count
  end
end
