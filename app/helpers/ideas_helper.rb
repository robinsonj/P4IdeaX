module IdeasHelper
  def idea_objects_list
    @ideas ||= Idea.all.to_a
  end
end
