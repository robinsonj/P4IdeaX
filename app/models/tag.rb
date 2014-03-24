class Tag < ActiveRecord::Base

  has_and_belongs_to_many :ideas

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def self.from_string(tag_names)
    tags = []

    tag_names.strip.downcase.gsub(/ +/, '').split(/,/).each do |tag_name|
      tags.push(find_or_create_by(name: tag_name)) if !tag_name.blank?
    end

    tags
  end
end
