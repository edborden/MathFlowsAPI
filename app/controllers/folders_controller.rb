class FoldersController < ApplicationController

	def create
		folder = Waterfall.new.folder
		current_user.folders<<folder
		render json: folder.reload
	end

	def update
		folder = Folder.update params[:id],folder_params
		render json: folder
	end

	def destroy
		folder = Folder.find params[:id]
		folder.destroy
		head :no_content
	end

	def folder_params
		params.require(:folder).permit :name
	end

end