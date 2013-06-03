class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.references :schools

      t.timestamps
    end

    create_table :schools do |t|
      t.string :name
      t.string :address
      t.references :accounts
    end

    create_table :accounts do |t|
      t.string :name
    end
  end
end
