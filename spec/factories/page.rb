FactoryGirl.define do

  factory :page do
    test
  
    factory :page_with_content do

      after(:create) do |page| 
        create_list( :block_with_children, 1, page:page )
      end       

    end

  end

end