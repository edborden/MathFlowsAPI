class SnippetsController < ApplicationController

	def create
		snippet = Snippet.new snippet_params
		snippet.question_number = false

		if params[:snippet][:equation]
			snippet.has_equation = true
			snippet.save
			equation = snippet.create_equation latex: params[:snippet][:equation]
			equation.create_image url: params[:snippet][:image]
		elsif params[:snippet][:image]
			snippet.has_image = true
			snippet.save
			snippet.create_image data: params[:snippet][:image]
		else
			snippet.save
		end

		block = Block.find params[:snippet][:block_id]
		position = Position.new position_params

		position.positionable = snippet
		block.child_positions<<position
		
		render json: snippet
	end

	def update
		snippet = Snippet.update params[:id], snippet_params

		position = snippet.position
		Position.update position.id, position_params
		position.reload

		render json: snippet
	end

	def destroy
		snippet = Snippet.find params[:id]
		snippet.position.destroy
		head :no_content
	end

	def snippet_params
		params.require(:snippet).permit :content
	end

	def position_params
		params.require(:snippet).permit :row,:col,:col_span,:row_span
	end

end
