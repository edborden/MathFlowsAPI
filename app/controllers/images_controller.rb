class ImagesController < ApplicationController

	def create
		image = Image.new image_params
		image.save
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
		params.require(:image).permit :binary,:block_id,:width,:height
	end

end
