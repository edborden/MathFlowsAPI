class ProjectionSerializer < ApplicationSerializer
  attributes :axis,:position,:size
  has_many :cells
  has_one :table
end