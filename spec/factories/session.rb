FactoryGirl.define do

  factory :session do
    user
    token { SecureRandom.hex(16) }
  end

end