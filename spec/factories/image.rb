FactoryGirl.define do

	factory :image do
		block
		cloudinary_id { Faker::Lorem.characters(10) }
		height 100
		width 100
	end

end