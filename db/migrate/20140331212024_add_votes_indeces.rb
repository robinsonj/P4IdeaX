class AddVotesIndeces < ActiveRecord::Migration
  def self.up
    change_table :votes do |t|
      t.index :user_id
      t.index :idea_id
    end
  end

  def self.down
    remove_index :votes, :user_id
    remove_index :votes, :idea_id
  end
end
