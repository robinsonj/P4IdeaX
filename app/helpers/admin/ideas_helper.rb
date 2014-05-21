module Admin::IdeasHelper

  def needs_attention(idea)
    'warning' if idea.current_pending
  end
end
