class CreateCurrents < ActiveRecord::Migration
  def self.up
    create_table :currents do |t|
      t.string 'title'
      t.text 'description'
      t.integer 'owner_id',    null: false

      t.timestamps
    end

    add_column :ideas, :current_id, :integer, null: true
  end

  def self.down
    drop_table :currents
    remove_column :ideas, :current_id
  end
end
