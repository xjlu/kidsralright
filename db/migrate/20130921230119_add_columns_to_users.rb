class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school_id, :integer
    add_column :users, :classroom_id, :integer
    add_index :users, :school_id
    add_index :users, :classroom_id
  end
end
