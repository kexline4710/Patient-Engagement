# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "Question Title"
    content "This is the content of the question."
  end
end
