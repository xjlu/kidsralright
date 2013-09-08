class CreatePhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :title, null: true
      t.references :posts
      t.references :users

      t.timestamps
    end
  end
end