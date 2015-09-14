FactoryGirl.define do

	factory :line do
		lineable { create :block}
		content ""
	end

end