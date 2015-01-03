class SnippetsController < ApplicationController

	def create
		snippet = Snippet.create snippet_params
		render json: snippet
	end

	def update
		snippet = Snippet.update params[:id], snippet_params
		render json: snippet
	end

	def destroy
		snippet = Snippet.find params[:id]
		snippet.destroy
		head :ok
	end

	def snippet_params
		params.require(:snippet).permit :content,:block_id
	end

end
