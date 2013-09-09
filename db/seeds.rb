# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# seed account
user = User.new
user.email = "admin@exmaple.com"
user.password = "password123!"
user.password_confirmation = "password123!"
user.skip_confirmation!
user.save!

accounts = []
["Briarcliff Day Care", "Bright Horizons Family Solutions"].each do |name|
  accounts << Account.where(:name => name).first_or_create!
end

school = School.where(:name => "Briarcliff center", :account => accounts.first).first_or_create!

# create classrooms
[ "Infants-1", "Infants-2", "Toddlers-1",
  "Toddlers-2", "Preschool-1", "Preschool-2"
].each do |name|
  classroom = Classroom.where(:name => name, :school => school).first_or_create!
  # classroom.schedules.where(:name => "2013 #{classroom.name} Summer Schedule").first_or_create!
end

# brighton school @ mission bay
ucsf_school = School.where(
  name: "The University Child Care Center at Mission Bay",
  account: accounts[1]).first_or_create!
%w(pelican dolphin whale).each do |name|
  Classroom.where(:name => name, :school => school).first_or_create!
end

# create class schedule for "Infants-2"
# infant2_classroom = Classroom.where(:name => "Infants-2", :school => school).first

# create seed data for template
# template = ActivityTemplate.new
# template.classroom = classroom
# first_a = Activity.new
# first_a.name = "Art"
# first_a.lessons = ["Paint", "Draw", "Cut"]
# template.activities << first_a
# template.save
