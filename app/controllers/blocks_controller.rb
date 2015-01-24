class BlocksController < ApplicationController

	def show
		block = Block.find params[:id]
		render json: block
	end

	def destroy
		block = Block.find params[:id]
		block.position.destroy
		head :no_content
	end

end
