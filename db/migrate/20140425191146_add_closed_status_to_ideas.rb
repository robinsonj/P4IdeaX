class AddClosedStatusToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :closed, :boolean, default: false, null: false
  end

  def self.down
    remove_column :ideas, :closed
  end
end
