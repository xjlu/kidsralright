class CreateKsrComments < ActiveRecord::Migration
  def change
    create_table :ksr_comments do |t|
      t.text :comment, :null => false
      t.references :commentable, :polymorphic => true
      t.references :user
      t.date :date_of_comment, :null => false

      t.timestamps
    end

    add_index :ksr_comments, :commentable_type
    add_index :ksr_comments, :commentable_id
    add_index :ksr_comments, :user_id
  end
end
