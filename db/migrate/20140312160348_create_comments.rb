class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, force: true do |t|
      t.integer 'idea_id'
      t.integer 'author_id'
      t.text 'text'

      t.timestamps
    end
  end
end
