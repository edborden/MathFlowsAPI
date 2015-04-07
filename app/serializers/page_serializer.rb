class PageSerializer < ApplicationSerializer
	has_one :test
	has_many :blocks, embed_in_root: true
end
