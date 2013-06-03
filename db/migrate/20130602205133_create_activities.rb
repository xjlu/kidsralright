class CreateActivities < ActiveRecord::Migration
  def change
    # Activity name such as Art, Creative Movement, Math/Science,
    # Music/Role Play/Social Play, Language Development, Computer
    # The user is allowed to come up with any name
    create_table :activities do |t|
      t.references :class
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
