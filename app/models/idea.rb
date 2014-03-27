class Idea < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'

  has_many :votes, :dependent => :destroy
  has_many :voters, :through => :votes, :source => :user, :class_name => 'User'
  has_many :comments, -> { order(created_at: :asc) }, :dependent => :destroy
  has_and_belongs_to_many :tags,
    -> { order('name') },
    join_table: "idea_tags"

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :description, :owner_id, presence: true

  include PgSearch
  pg_search_scope :search_tags, :associated_against => {
    :tags => :name
  }

  def tag_names
    tags.map{ |tag| tag.name }.sort.join(', ')
  end
end
