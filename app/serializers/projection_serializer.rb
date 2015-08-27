class ProjectionSerializer < ApplicationSerializer
	attributes :axis,:position
	has_many :cells
	has_one :table
end
