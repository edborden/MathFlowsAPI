class ImageSerializer < ApplicationSerializer
	attributes :binary,:height,:width
	has_one :block
end