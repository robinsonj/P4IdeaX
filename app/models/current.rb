class Current < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

  DEFAULT_CURRENT_ID = 0

  belongs_to :owner, class_name: 'User'

  has_many :ideas, foreign_key: 'current_id'

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, :owner_id, presence: true
  validates_associated :owner

  def description_excerpt(excerpt_size = 400)
    desc_compact = description.gsub(/\s+/, ' ')  # Remove line breaks & extra space for compact excerpt
    if desc_compact.length <= excerpt_size
      desc_compact
    else
      desc_compact[0...excerpt_size - 3] + '...'  # TODO: respect word boundaries
    end
  end
end
