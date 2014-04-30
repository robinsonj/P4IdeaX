class AddStatusToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :status, :string, default: 'new', allow_nil: false
  end

  def self.down
    remove_column :ideas, :status
  end
end
