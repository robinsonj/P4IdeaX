class ChangeUserIndeces < ActiveRecord::Migration
  def self.up
    remove_index :users, :email

    add_index :users, :email, unique: false, using: 'btree'
    add_index :users, column: [:provider, :uid], unique: true, using: 'btree'

  end

  def self.down
    remove_index :users, :email
    remove_index :users, column: [:provider, :uid]

    add_index :users, :email, unique: true, using: 'btree'
  end
end
