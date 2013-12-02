# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do |f|
    f.title "Question 1"
    f.content "I think this is great"
    f.private false
  end
end
