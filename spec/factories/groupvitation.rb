FactoryGirl.define do

	factory :groupvitation do
		sender
		receiver
		receiver_email { receiver.present? ? receiver.email : Faker::Internet.email }
	end

end