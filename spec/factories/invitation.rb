FactoryGirl.define do

	factory :invitation do
		referrer
		referral
		referral_email { referral.present? ? referral.email : Faker::Internet.email }
	end

end