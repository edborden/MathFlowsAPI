class PageSerializer < ApplicationSerializer
	has_one :test
	has_many :blocks
end
