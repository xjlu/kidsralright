class CreateActivities < ActiveRecord::Migration
  def change
    # Activity name such as Art, Creative Movement, Math/Science,
    # Music/Role Play/Social Play, Language Development, Computer
    # The user is allowed to come up with any name, but we build a seed list in a yml file for now
    create_table :activities do |t|
      t.references :classes
      t.date :date
      t.string :name
      t.text :description

      t.timestamps
    end

    # lessons can use acts_as_taggable_on, and using 'lessons' as the context

    create_table :lessons do |t|
      t.string :name
    end

    create_table :daily_lessons do |t|
      t.references :activitites
      t.references :lessons
    end

  end
end
