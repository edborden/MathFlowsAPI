class SnippetsController < ApplicationController

	def create
		snippet = Snippet.new snippet_params

		if params[:snippet][:equation]
			snippet.has_equation = true
			snippet.save
			equation = snippet.create_equation latex: params[:snippet][:equation]
			equation.create_image url: params[:snippet][:image]
		else
			snippet.save
		end
		
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
		params.require(:snippet).permit :content,:row, :col, :height, :width
	end

end
