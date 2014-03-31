class RecreateVotes < ActiveRecord::Migration
  def self.up
    drop_table :votes

    create_table :votes, :force => true do |t|
      t.references  :user,  :null => false, index: true
      t.references  :idea,  :null => false, index: true
      t.integer     :value, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :votes

    create_table :votes, :id => false, :force => true do |t|
      t.references  :user
      t.references  :idea
      t.integer     :value, :null => false
      t.timestamps
    end
  end
end
