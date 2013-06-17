class CreateComments < ActiveRecord::Migration
  def change
    create_table :ksrcomments do |t|
      t.text :comment, :null => false
      t.references :commentable, :polymorphic => true
      t.references :user
      t.date :date_of_comment, :null => false

      t.timestamps
    end

    add_index :ksrcomments, :commentable_type
    add_index :ksrcomments, :commentable_id
    add_index :ksrcomments, :user_id
  end
end
