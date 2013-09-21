class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.timestamps
    end
    create_table :users_roles, id: false do |t|
      t.references :user, index: true
      t.references :role, index: true
      t.timestamps
    end
  end
end
