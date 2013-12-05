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
p3 = Participant.create(first_name: "Clay", last_name: "Lyons", email: "c@dbc.com", password: "password", subject_number: 40010 )
p3.generate_password
p3.save

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

Feeling.create(emotion: "happy")
Feeling.create(emotion: "comfortable")
Feeling.create(emotion: "sad")
Feeling.create(emotion: "depressed")
Feeling.create(emotion: "sleepy")
Feeling.create(emotion: "hungry")
























































title1 = "My family doesn't understand what a trial is."

question1 = "I am getting bombarded with questions by my family about why I am participating in this trial. They are concerned that I am spending less time with them and the compensation is not worth it."

answer1 = "Clinical trials are a critical component of comprehensive medical care that make our lives better. Without medical research there would be no advance in the care and treatment of illness and disease. It might be helpful to speak to your family members about the neccesity of your participation to further advancements in medical care that we all rely on."

title2 = "Known side effects."

question2 = "I can't find the documentation I recieved in phase 1 on potential side effects. I wanted to take some of this to my doctor, because I've been having indigestion frequently. We've received so much literature I can't keep it straight. Is there a website were I can get more information on the effects of the medication I am on?"

answer2 = "There certainly is a plethora of documentation that a participant has to keep track of. I've sent a email to the research assistant managing the Valproic Acid (VPA) clinical trials to get the most current information on known side effects. The stake holders of this trial have chosen not to maintain a web link to this information. Typically, they prefer to directly share documents with patients and their doctors. I will forward the most current documentation to you and your doctor by mail or email if your prefer."

title3 = "Insurance won't help with new glasses."

queston2 = "The past couple weeks my sight has been bothering me. I don’t see is well with the glasses that I have might be time for a new pair of course insurance isn’t going to cover it right now. What are some options to help me get an updated prescription?"

answer3 = "I'm sorry to hear your eyesight has been bothering you. I understand how difficult it can be to pay for new glasses and optometrist visits. If you need a new presrcription made I can make you an apointment through the clinic and they have discounted eyewear available. If you still find the options they provide too expensive, there are charitiable organizations in your community that can help. Let me know if you would like an appointment at the clinic or if I can provide information on organizations that provide assistance with purchasing eyewear."

title4 = "Having trouble with transportation."

question4 = "Have I told you the many reasons I hate not driving one of them is that I have to depend on other people to take my precious cargo and tonight my father in law got into car accident driving with one of my neighbors. I hate not driving, but I can't see well enough to do it when it gets dark. I'm scared to ride the bus alone. Can someone from the trial pick me up tomorrow morning?"

answer4 = "I know how hard it is to depend on others especially when you are dealing with deteriorating eyesight. Our trial is aimed to help others in your position and we greatly appreciate your sacrifice to further research that aims to cure Retinitis Pigmentosa. Unfortunately, we don't have a rideshare service set up for clinical appointments, but I can help you find public transportation that accomodates people with handicaps."

title5 = "Genetic links to Retinitis Pigmentosa."

question5 = "My daughter was asking me questions about wether she will inherit the condition I have. It's been a rough couple of years and she has seen me struggle with losing my job and needing more care from friends and family. I think she is scared that she will lose her eyesight too. What are the chances of her getting my disease or does that depend on both parents genes?"

answer5 = "The genetic factors in contracting Retinitis Pigmentosa
 are not fully known. I believe that your family will benefit by being informed and asking questions. Traits of X-linked retinitis pigmentosa are passed on by carrier mothers or affected fathers, females are rarely affected by this form of the diease. Patients with this from of retinitis pigmentosa present with symptoms of night blindness from childhood; they have progressive constriction of visual fields and loss of vision in mid-life. Consider bringing your daughter along when you visit your physician and the research facilities. She will have the opportunity to ask her own questions and become more comfortable with the process of medical treatment."

"

