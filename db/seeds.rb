# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Participant.new(first_name: "Katy", last_name: "Exline", email: 'kathryn.exline@gmail.com', password: "password" )
p1.save
UserMailer.welcome_email(p1).deliver
p2 = Participant.new(first_name: "Jane", last_name: "Smith", email: "j@dbc.com", password: "password" )
p2.save
p3 = Participant.new(first_name: "Clay", last_name: "Lyons", email: "c@dbc.com", password: "password" )
p3.save

# p1.questions.create(title: "Question no. 1", content: "What do you think of my first question?")
# p1.questions.create(title: "Question no. 2", content: "What do you think of my second question?")
# p2.questions.create(title: "Question no. 1", content: "What do you think of my first question?")

