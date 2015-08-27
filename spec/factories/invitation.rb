FactoryGirl.define do

	factory :invitation do
		association :referrer, factory: :user
		referral_email { Faker::Internet.email }
	end

end