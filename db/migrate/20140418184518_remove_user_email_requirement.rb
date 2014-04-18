class RemoveUserEmailRequirement < ActiveRecord::Migration
  def self.up
    change_column :user, :email, :string, :null => true
  end

  def self.down
    change_column :user, :email, :string, :default => "", :null => false
  end
end
