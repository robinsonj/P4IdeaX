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

  private

    def find_or_create_by_name(tag_name)
      # Strip out any HTML tags that may have been slipped into the input.
      tag_name = strip_tags(tag_name)

      # Find the tag if it already exists, otherwise create a new one.
      find_by_name(tag_name) || create!(:name => tag_name)
    end
end
