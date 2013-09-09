class CreatePostTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :message
      t.references :classroom
      t.references :user

      t.timestamps
    end
  end
end
