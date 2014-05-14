class AddFriednlySlugToCurrents < ActiveRecord::Migration
  def self.up
    add_column :currents, :slug, :string, unique: true, null: false
  end

  def self.down
    remove_column :currents, :slug
  end
end
