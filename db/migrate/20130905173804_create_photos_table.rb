class CreatePhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :title, null: true
      t.timestamps
    end
  end
end