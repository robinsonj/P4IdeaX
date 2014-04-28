class Idea < ActiveRecord::Base

  belongs_to :owner, :class_name => 'User'
  belongs_to :current

  has_many :votes, :dependent => :destroy, :foreign_key => [:user_id, :idea_id]
  has_many :voters, :through => :votes, :source => :user, :class_name => 'User'
  has_many :comments, -> { order(created_at: :asc) }, :dependent => :destroy do
    def visible
      where :hidden => false
    end
  end
  has_and_belongs_to_many :tags,
    -> { order('name').uniq },
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

  def add_vote(vote)
    vote.lock!
    self.lock!
    self.rating += vote.value
    self.save!
    vote
  end

  def change_vote(vote)
    vote.lock!
    self.lock!
    self.rating += vote.value * 2
    self.save!
    vote
  end

  def subtract_vote(vote)
    vote.lock!
    self.lock!
    self.rating -= vote.value
    self.save!
    vote
  end

  def description_excerpt(excerpt_size = 400)
    desc_compact = description.gsub(/\s+/, ' ')  # Remove line breaks & extra space for compact excerpt
    if desc_compact.length <= excerpt_size
      desc_compact
    else
      desc_compact[0...excerpt_size-3] + '...'  # TODO: respect word boundaries
    end
  end
end
