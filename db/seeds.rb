# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

account = Account.find_or_create_by_name("Briarcliff Day Care")

school = School.create(:name => "Briarcliff center", :account => account)

classroom = Classroom.create(:name => "Toddler", :school => school)

# create seed data for template
template = ActivityTemplate.new
template.classroom = classroom
first_a = Activity.new
first_a.name = "Art"
first_a.lessons = ["Paint", "Draw", "Cut"]
template.activities << first_a
template.save
