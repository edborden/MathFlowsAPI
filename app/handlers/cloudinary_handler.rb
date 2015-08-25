class CloudinaryHandler
	include Handler

	def delete_resource cloudinary_id
		Cloudinary::Api.delete_resources([cloudinary_id]) unless is_on_intro_test?(cloudinary_id)
	end

	def is_on_intro_test? cloudinary_id
		cloudinary_id == "block_images/eyjdrh6xrt2no9a2ezam" or cloudinary_id == "block_images/v7bz2rx9bs65ecbhyf0n"
	end

end