# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

<<<<<<< HEAD
=======

>>>>>>> f7e31e8c824a430f3a434c94a6fae2e43473bfbe
p1 = Participant.new(first_name: "Katy", last_name: "Exline", email: "k@dbc.com", password: "password", subject_number: 40008 )
p1.save
p2 = Participant.new(first_name: "Jane", last_name: "Smith", email: "j@dbc.com", password: "password", subject_number: 40009 )
p2.save
p3 = Participant.new(first_name: "Clay", last_name: "Lyons", email: "c@dbc.com", password: "password", subject_number: 40010 )
p3.save

p1.questions.create(title: "Question no. 1", content: "What do you think of my first question?")
p1.questions.create(title: "Question no. 2", content: "What do you think of my second question?")
p2.questions.create(title: "Question no. 1", content: "What do you think of my first question?")

c1 = Coordinator.create(email: "james@james.com", password: "password")

c1.participants << p1
c1.participants << p2
<<<<<<< HEAD
c1.participants << p3
=======
c1.participants << p3
>>>>>>> f7e31e8c824a430f3a434c94a6fae2e43473bfbe
