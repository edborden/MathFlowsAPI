Fabricator(:user) do

end

Fabricator(:active_user, from: :user) do
	name { Faker::Name.first_name }
	email { |attrs| "#{attrs[:name].parameterize}@example.com" }
	google_id {Faker::Lorem.characters(10)}
	pic "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/p50x50/1456084_10152063553349906_822635544_n.jpg?oh=ceb7224e31d628f8d23236282b35068f&oe=54E4FB40&__gda__=1424790935_5167499d3af2d481c76c7d02afc043a7"
	gender "male"
	guest false 
end

Fabricator(:active_user_with_session, from: :active_user) do
	after_create { |attrs| User.find(attrs[:id]).create_session }
end

Fabricator(:user_with_block, from: :active_user_with_session) do
	after_create { |attrs| Fabricate(:test, user_id:attrs[:id]) }	
end

Fabricator(:invitation) do
	referrer_id Faker::Number.number(3)
	referral_email { "#{Faker::Lorem.characters(10)}@test.com" }
end

Fabricator(:block) do
end

Fabricator(:page) do
	blocks(count:1)
end

Fabricator(:test) do
	pages(count:1)
end