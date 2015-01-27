class BlocksController < ApplicationController

	def show
		block = Block.find params[:id]
		render json: block
	end

	def destroy
		block = Block.find params[:id]
		block.destroy
		head :no_content
	end

end
