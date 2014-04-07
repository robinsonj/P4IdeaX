class CreateCurrents < ActiveRecord::Migration
  def change
    create_table :currents do |t|

      t.timestamps
    end
  end
end
