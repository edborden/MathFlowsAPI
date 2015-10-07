class GroupSerializer < ApplicationSerializer
  attributes :name
  has_many :users, embed: :ids, include: :true
end