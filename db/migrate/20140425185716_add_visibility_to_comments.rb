class AddVisibilityToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :hidden, :boolean, :default => true, :null => false
  end

  def self.down
    remove_column :comments, :hidden
  end
end
