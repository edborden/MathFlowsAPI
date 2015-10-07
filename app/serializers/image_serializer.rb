class ImageSerializer < ApplicationSerializer
  attributes :cloudinary_id,:height,:width,:block_position
  has_one :block
  has_one :alignment, embed: :ids, include: :true
end