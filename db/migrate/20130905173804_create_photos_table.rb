class CreatePhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :title, null: true
      t.references :post
      t.references :user

      t.timestamps
    end
  end
end