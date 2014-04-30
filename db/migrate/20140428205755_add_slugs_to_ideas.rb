class AddSlugsToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :slug, :string, :unique => true, :null => false
  end

  def self.down
    remove_column :ideas, :slug
  end
end
