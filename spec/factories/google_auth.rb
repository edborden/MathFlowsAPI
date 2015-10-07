FactoryGirl.define do

  factory :google_auth do
    google_id { Faker::Lorem.characters(10) }
    user
  end

end