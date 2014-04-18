class RemoveUserEmailRequirement < ActiveRecord::Migration
  def self.up
    change_column :users, :email, :string, :null => true
  end

  def self.down
    change_column :users, :email, :string, :default => "", :null => false
  end
end
