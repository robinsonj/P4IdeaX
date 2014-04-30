class Current < ActiveRecord::Base

  DEFAULT_CURRENT_ID = 0

  belongs_to :owner, :class_name => 'User'

  has_many :ideas, :foreign_key => 'current_id'

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :description, :owner_id, presence: true
  validates_associated :owner

end
