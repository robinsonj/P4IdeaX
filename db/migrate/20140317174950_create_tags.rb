class CreateTags < ActiveRecord::Migration
  def change
    create_table(:tags) do |t|
      t.string "name"
    end

    create_join_table(:tags, :ideas, table_name: :idea_tags) do |t|
      t.integer "tag_id"
      t.integer "idea_id"

      t.index :tag_id
      t.index :idea_id
    end
  end
end
