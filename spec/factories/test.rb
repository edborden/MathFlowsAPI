FactoryGirl.define do

  factory :test do
    user

    factory :test_with_content do
      after(:create) do |test| 
        create_list(:page_with_content,1,test:test)
      end 
    end

  end

end