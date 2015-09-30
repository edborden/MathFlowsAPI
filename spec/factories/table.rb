FactoryGirl.define do

	factory :table do
		block
		block_position 0
		rows_count 0
		cols_count 0

		factory :table_with_content do
			after(:create) do |table| 
				create_list(:row,1,table:table)
				create_list(:col,1,table:table)
				create_list(:cell,1,row:table.rows.first,col:table.rows.first,table:table)
			end
		end
	end

end