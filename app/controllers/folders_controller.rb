class FoldersController < ApplicationController
	include AddHeaders

	def create
		folder = Folder.create folder_params
		render json: folder
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
		params.require(:folder).permit :name,:open,:folder_id,:flow_folder,:student_folder,:user_id
	end

end