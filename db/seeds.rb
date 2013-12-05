# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p1 = Participant.create(first_name: "Katy", last_name: "Exline", email: "kathryn.exline@gmail.com", password: "password", subject_number: 40008 )
p1.generate_password
p1.save
# p1.send_initial_email
p2 = Participant.create(first_name: "Jane", last_name: "Smith", email: "j@dbc.com", password: "password", subject_number: 40009 )
# p2.generate_password
p2.save
p3 = Participant.create(first_name: "Alex", last_name: "Brett", email: "c@dbc.com", password: "password", subject_number: 40010 )
p3.generate_password
p3.save
p4 = Participant.create(first_name: "John", last_name: "Franks", email: "a@dbc.com", password: "password", subject_number: 40011 )
p4.generate_password
p4.save
p5 = Participant.create(first_name: "Judy", last_name: "Smith", email: "b@dbc.com", password: "password", subject_number: 40012 )
p5.generate_password
p5.save
p6 = Participant.create(first_name: "Francis", last_name: "Astonia", email: "d@dbc.com", password: "password", subject_number: 40013 )
p6.generate_password
p6.save
p7 = Participant.create(first_name: "Maria", last_name: "Peters", email: "e@dbc.com", password: "password", subject_number: 40014 )
p7.generate_password
p7.save
p8 = Participant.create(first_name: "Sunny", last_name: "Johnson", email: "f@dbc.com", password: "password", subject_number: 40015 )
p8.generate_password
p8.save
p9 = Participant.create(first_name: "George", last_name: "Williams", email: "g@dbc.com", password: "password", subject_number: 40016 )
p9.generate_password
p9.save
p10 = Participant.create(first_name: "Georgia", last_name: "Jones", email: "h@dbc.com", password: "password", subject_number: 40017 )
p10.generate_password
p10.save
p11 = Participant.create(first_name: "Alexis", last_name: "Brown", email: "i@dbc.com", password: "password", subject_number: 40018 )
p11.generate_password
p11.save
p12 = Participant.create(first_name: "Jim", last_name: "Davis", email: "j@dbc.com", password: "password", subject_number: 40019 )
p12.generate_password
p12.save
p13= Participant.create(first_name: "Peter", last_name: "Miller", email: "k@dbc.com", password: "password", subject_number: 40020 )
p13.generate_password
p13.save
p13 = Participant.create(first_name: "Mary", last_name: "Taylor", email: "l@dbc.com", password: "password", subject_number: 40021 )
p13.generate_password
p13.save
p14 = Participant.create(first_name: "Paul", last_name: "Anderson", email: "m@dbc.com", password: "password", subject_number: 40022 )
p14.generate_password
p14.save
p15 = Participant.create(first_name: "Emily", last_name: "Lyons", email: "n@dbc.com", password: "password", subject_number: 40023 )
p15.generate_password
p15.save
p16 = Participant.create(first_name: "Sup", last_name: "Thomas", email: "m@dbc.com", password: "password", subject_number: 40024 )
p16.generate_password
p16.save
p17 = Participant.create(first_name: "Anastasia", last_name: "White", email: "l@dbc.com", password: "password", subject_number: 40025 )
p17.generate_password
p17.save
p18= Participant.create(first_name: "Jasmine", last_name: "Harris", email: "p@dbc.com", password: "password", subject_number: 40026 )
p18.generate_password
p18.save
p19 = Participant.create(first_name: "Nate", last_name: "Garcia", email: "q@dbc.com", password: "password", subject_number: 40027 )
p19.generate_password
p19.save
p20 = Participant.create(first_name: "Clarke", last_name: "Lewis", email: "r@dbc.com", password: "password", subject_number: 40028 )
p20.generate_password
p20.save


c1 = Coordinator.create(first_name: "james", email: "james@james.com", password: "password")

c1.participants << p1
c1.participants << p2
c1.participants << p3
c1.participants << p4
c1.participants << p5
c1.participants << p6
c1.participants << p7
c1.participants << p8
c1.participants << p9
c1.participants << p10
c1.participants << p11
c1.participants << p12
c1.participants << p13
c1.participants << p14
c1.participants << p15
c1.participants << p16
c1.participants << p17
c1.participants << p18
c1.participants << p19
c1.participants << p20


p1.questions.create(title: "Question no. 1", content: "What do you think of my first question?")
p1.questions.create(title: "Question no. 2", content: "What do you think of my second question?")


t1 = Trial.create(number: 231138, title: "Psychlogrine", information: "Many people have suffered from the perception that their lawn is not green enough. Introducing Psychlogrine, a drug that will change that perception. After pouring thousands of dollars into chemical treatments homeowners are typically left unsatisfied. This drug will save money and give users the peace of mind they has alluded them for years.")

c1.trial_id = t1.id
c1.save

Feeling.create(emotion: "happy")
Feeling.create(emotion: "comfortable")
Feeling.create(emotion: "sad")
Feeling.create(emotion: "depressed")
Feeling.create(emotion: "sleepy")
Feeling.create(emotion: "hungry")






