module ApplicationHelper

  def currents_list
    Current.all.order(title: :desc).map{ |current| [current.title, current.id] }
  end
end
