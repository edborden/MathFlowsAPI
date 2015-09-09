FactoryGirl.define do

	factory :block do
		row 1
		col 1

		user

		factory :block_with_invalidation do
			after(:create) {|block| create_list(:invalidation,1,block:block)} 
		end

		factory :block_with_children do
			after(:create) do |block| 
				create_list(:table,1,block:block)
				create_list(:image,1,block:block)
			end	
		end

		factory :header do
			kind "header"
		end
	end

end