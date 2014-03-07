class CreateIdeas < ActiveRecord::Migration
  def self.up
    # Create the base ideas table, overriding one if it already exists.
    create_table :ideas, :force => do |t|
      t.text    "title"
      t.text    "description"
      t.integer "owner_id"

      t.timestamps
    end
  end

  def self.down
    drop_table :ideas
  end
end
