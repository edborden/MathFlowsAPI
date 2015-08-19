FactoryGirl.define do

	factory :session do
		user
		token { SecureRandom.hex(16) }
	end

	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.email }
		pic "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/p50x50/1456084_10152063553349906_822635544_n.jpg?oh=ceb7224e31d628f8d23236282b35068f&oe=54E4FB40&__gda__=1424790935_5167499d3af2d481c76c7d02afc043a7"
		gender "male"

		factory :user_with_session do
			session
		end
	end

	factory :google do
		google_id { Faker::Lorem.characters(10) }
		user
	end

	factory :line do
		block
	end

	factory :block do

		factory :block_with_invalidation do
			after(:create) {|block| create_list(:invalidation,1,block:block)} 
		end
	end

	factory :page do
		test
	end

	factory :test do
		folder
		user
	end

	factory :folder do
		user

		factory :folder_with_test do
			after(:create) {|folder| create_list(:test,1,folder:folder)} 
		end
	end

	factory :group do
	end

	factory :groupvitation do
		association :sender, factory: :user
		receiver_email { Faker::Internet.email }
	end

	factory :invitation do
		association :referrer, factory: :user
		referral_email { Faker::Internet.email }
	end

	factory :image do
		block
		cloudinary_id { Faker::Lorem.characters(10) }
		height 100
		width 100
	end

	factory :invalidation do
		block
	end

end