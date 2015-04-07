class Page < ActiveRecord::Base
	has_many :blocks, dependent: :destroy
	belongs_to :test

	amoeba do
		enable
	end

end
