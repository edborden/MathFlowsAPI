Fabricator(:user) do
	name { Faker::Name.first_name }
	facebookid {Faker::Lorem.characters(10)}
	smallpic "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xap1/v/t1.0-1/p50x50/1456084_10152063553349906_822635544_n.jpg?oh=ceb7224e31d628f8d23236282b35068f&oe=54E4FB40&__gda__=1424790935_5167499d3af2d481c76c7d02afc043a7"
	mediumpic "https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-xap1/v/t1.0-9/p130x130/1456084_10152063553349906_822635544_n.jpg?oh=fbde6daeb0e704e70d8ff0497b647a82&oe=54E5D9A8&__gda__=1428123508_af5d69f1f151b27762c7fcd74f3fb0e6"
	largepic "https://fbcdn-sphotos-f-a.akamaihd.net/hphotos-ak-xap1/v/t1.0-9/1456084_10152063553349906_822635544_n.jpg?oh=c5debda4db66896833ba6d0c51cf07d1&oe=551C8CCB&__gda__=1423363987_27f27aec12e4c0b370aae26054d54241"
	after_create { |attrs| User.find(attrs[:id]).create_session token: Faker::Lorem.characters(10)}
end