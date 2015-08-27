FactoryGirl.define do

	factory :table do
		block

		factory :table_with_content do
			after(:create) do |table| 
				create_list(:row_with_cells,1,table:table)
				create_list(:col_with_cells,1,table:table)
			end
		end
	end

end