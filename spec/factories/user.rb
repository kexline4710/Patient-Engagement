FactoryGirl.define do
	factory :participant do |f|
		f.first_name "Clay"
		f.last_name	"Morten"
		f.email	"Cman1@aol.com"
		f.password "password"
		f.subject_number 123
		f.coordinator_id 1
		f.authenticity_token "abc123"
		f.first_time_login false
	end
end