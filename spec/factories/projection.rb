FactoryGirl.define do

  factory :projection do
    table

    factory :row do
      axis 0

      factory :row_with_cells do
        after(:create) {|projection| create_list(:cell,3,row:projection,table:projection.table)}
      end
    end

    factory :col do
      axis 1

      factory :col_with_cells do
        after(:create) {|projection| create_list(:cell,3,col:projection,table:projection.table)}
      end
    end
  end

end