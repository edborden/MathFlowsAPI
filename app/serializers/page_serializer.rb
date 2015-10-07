class PageSerializer < ApplicationSerializer
  has_one :test
  has_many :blocks, embed: :ids, include: :true
end