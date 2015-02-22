class BlocksController < ApplicationController

	def show
		block = Block.find params[:id]
		render json: block
	end

	def update
		block = Block.update params[:id], block_params
		render json: block.reload		
	end

	def destroy
		block = Block.find params[:id]
		block.destroy
		head :no_content
	end

	def block_params
		params.require(:block).permit :content,:question
	end

end
