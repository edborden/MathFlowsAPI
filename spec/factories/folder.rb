FactoryGirl.define do

	factory :folder do
		user

		factory :folder_with_test do
			after(:create) {|folder| create_list(:test,1,folder:folder)} 
		end
	end

end