class Idea < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'

  has_many :comments, -> { order(created_at: :asc) }, :dependent => :destroy
  has_and_belongs_to_many :tags, -> { order('name') }

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true

end
