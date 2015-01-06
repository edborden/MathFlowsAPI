require 'open-uri'
require 'base64'

class SnippetsController < ApplicationController

	def create
		snippet = Snippet.new snippet_params
		if snippet.equation
			file = open params[:snippet][:equation]
			enc = Base64.encode64 file.read
			snippet.equation = enc
		end
		snippet.save
		render json: snippet
	end

	def update
		snippet = Snippet.update params[:id], snippet_params
		render json: snippet
	end

	def destroy
		snippet = Snippet.find params[:id]
		snippet.destroy
		head :no_content
	end

	def snippet_params
		params.require(:snippet).permit :content,:block_id,:equation
	end

end
