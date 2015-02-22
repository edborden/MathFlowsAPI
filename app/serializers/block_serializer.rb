class BlockSerializer < ApplicationSerializer
	attributes :question,:content
	has_many :positions
	has_one :user

end