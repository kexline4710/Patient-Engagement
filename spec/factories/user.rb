FactoryGirl.define do
	sequence :email do |n|
		"email#{n}@email.com"
	end

	factory :participant do
		first_name "Clay"
		last_name	"Morten"
		email
		password "password"
		subject_number 123
		coordinator_id 1
		authenticity_token "12412wer"
		first_time_login false
	end
end
