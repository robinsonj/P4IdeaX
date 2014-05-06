class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes, id: false, force: true do |t|
      t.references :user
      t.references :idea
      t.integer :value, null: false
      t.timestamps
    end

    add_column :ideas, :rating, :integer, default: 0
  end

  def self.down
    drop_table :votes
    remove_column :ideas, :rating
  end
end
