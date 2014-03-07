class Idea < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'

  validates_presence_of :title, :description

end
