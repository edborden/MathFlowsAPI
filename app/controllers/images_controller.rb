class ImagesController < ResourceController

	def resource_params
		params.require(:image).permit :cloudinary_id,:block_id,:width,:height,:scale
	end

end
