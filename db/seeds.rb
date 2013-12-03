# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Participant.create(first_name: "Katy", last_name: "Exline", email: "kathryn.exline@gmail.com", password: "password", subject_number: 40008 )
p1.generate_password
# p1.save
# p1.send_initial_email
p2 = Participant.create(first_name: "Jane", last_name: "Smith", email: "j@dbc.com", password: "password", subject_number: 40009 )
# p2.generate_password
p2.save
p3 = Participant.create(first_name: "Clay", last_name: "Lyons", email: "c@dbc.com", password: "password", subject_number: 40010 )
p3.generate_password
# p3.save

p1.questions.create(title: "Question no. 1", content: "What do you think of my first question?")
p1.questions.create(title: "Question no. 2", content: "What do you think of my second question?")
p2.questions.create(title: "Question no. 1", content: "What do you think of my first question?")

c1 = Coordinator.create(first_name: "james", email: "james@james.com", password: "password")

c1.participants << p1
c1.participants << p2
c1.participants << p3

t1 = Trial.create(number: 231138, title: "Psychlogrine", information: "Many people have suffered from the perception that their lawn is not green enough. Introducing Psychlogrine, a drug that will change that perception. After pouring thousands of dollars into chemical treatments homeowners are typically left unsatisfied. This drug will save money and give users the peace of mind they has alluded them for years.")

c1.trial_id = t1.id
c1.save





