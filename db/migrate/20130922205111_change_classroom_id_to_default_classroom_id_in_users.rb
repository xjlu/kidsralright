class ChangeClassroomIdToDefaultClassroomIDInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :classroom_id, :default_classroom_id
  end
end
