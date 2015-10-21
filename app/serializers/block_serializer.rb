class BlockSerializer < ApplicationSerializer
  attributes :kind,:row,:col,:row_span,:col_span,:height,:width,:x,:y,:content_invalid
  has_many :images, embed: :ids, include: :true
  has_one :user
  has_one :page
  has_many :lines, embed: :ids, include: :true
  has_many :tables, embed: :ids, include: :true
end