class ImagesController < ApplicationController

	def create
		image = Image.create image_params
		render json: image
	end

	def update
		image = Image.update params[:id], snippet_params
		render json: image.reload
	end

	def destroy
		image = Image.find params[:id]
		image.destroy
		head :no_content
	end

	def image_params
		params.require(:image).permit :cloudinary_id,:block_id,:width,:height,:scale
	end

end
