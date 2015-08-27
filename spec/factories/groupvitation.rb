FactoryGirl.define do

	factory :groupvitation do
		association :sender, factory: :user
		receiver_email { Faker::Internet.email }
	end

end