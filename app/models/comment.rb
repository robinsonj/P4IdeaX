class Comment < ActiveRecord::Base

  belongs_to :idea
  belongs_to :author, :class_name => 'User'

  validates_presence_of :idea_id, :author_id, :text

  def visible?
    !hidden
  end
end
