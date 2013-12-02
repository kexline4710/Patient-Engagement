# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :coordinator do |f|
   f.email "coor@smo.com"
   f.password "talidaga"
   f.authenticity_token "abc123"
   f.trial_id Trial.find_by_number(231138)
  end
end
