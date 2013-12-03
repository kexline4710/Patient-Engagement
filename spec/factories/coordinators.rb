# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :coordinator do |f|
    f.first_name "Bobby"
    f.email "coor@smo.com"
    f.password "talidaga"
    f.authenticity_token "abc123"
    f.association :trial
 end
end
