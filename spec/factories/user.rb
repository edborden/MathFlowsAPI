FactoryGirl.define do

	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		pic "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/p50x50/1456084_10152063553349906_822635544_n.jpg?oh=ceb7224e31d628f8d23236282b35068f&oe=54E4FB40&__gda__=1424790935_5167499d3af2d481c76c7d02afc043a7"
		gender "male"

		factory :user_with_session do
			session
		end

		factory :user_with_group do
			group
		end
	end

end