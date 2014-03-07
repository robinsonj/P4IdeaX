class Idea < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true

end
