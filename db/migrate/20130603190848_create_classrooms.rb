class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.references :school

      t.timestamps
    end

    create_table :schools do |t|
      t.string :name
      t.string :address
      t.references :account
    end

    create_table :accounts do |t|
      t.string :name
    end
  end
end
