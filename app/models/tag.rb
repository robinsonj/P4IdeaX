class Tag < ActiveRecord::Base
  has_and_belongs_to_many :ideas,
                          -> { order('rating').uniq },
                          join_table: 'idea_tags'

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  include PgSearch
  pg_search_scope :search_name, against: :name

  def self.from_string(tag_names)
    tags = []

    tag_names.first.strip.downcase.gsub(/ +/, '').split(/,/).each do |tag_name|
      tags.push(find_or_create_by(name: tag_name)) unless tag_name.blank?
    end

    tags
  end
end
