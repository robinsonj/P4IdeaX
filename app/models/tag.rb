class Tag < ActiveRecord::Base

  has_and_belongs_to_many :ideas

  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
