class ImageSerializer < ApplicationSerializer
	attributes :cloudinary_id,:height,:width
	has_one :block
end