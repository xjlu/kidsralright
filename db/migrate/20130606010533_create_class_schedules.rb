class CreateClassSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.references :classrooms
      t.string :name
      t.date :start_date
      t.date :end_date
    end
    
    create_table :schedule_items do |t|
      t.references :schedules
      t.time :start_time
      t.time :end_time
      t.string :title
      t.text :description
      t.text :comments

      t.timestamps
    end
  end
end
