FactoryGirl.define do

	factory :block do
		row 1
		col 1

		user

		factory :block_with_invalidation do
			content_invalid true 
		end

		factory :block_with_children do
			after(:create) do |block| 
				create_list(:table,1,block:block,block_position:0)
				create_list(:image,1,block:block,block_position:1)
			end	
		end

		factory :header do
			kind "header"
		end
	end

end