class Current < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'

  has_many :ideas, :foreign_key => 'current_id'
end
