class AddCurrentPendingToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :current_pending, :boolean, allow_nil: false, default: false
  end

  def self.down
    remove_column :ideas, :current_pending
  end
end
