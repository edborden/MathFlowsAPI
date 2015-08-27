FactoryGirl.define do

	factory :block do
		row 1
		col 1

		user

		factory :block_with_invalidation do
			after(:create) {|block| create_list(:invalidation,1,block:block)} 
		end

		factory :header do
			kind "header"
		end
	end

end