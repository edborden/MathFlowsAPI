class ImageSerializer < ApplicationSerializer
	attributes :cloudinary_id,:height,:width,:scale
	has_one :block
end