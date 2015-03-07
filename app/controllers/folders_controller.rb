class FoldersController < ApplicationController
	include AddHeaders

	def create
		folder = Waterfall.new.folder(MasterMold.new.fresh_folder)
		current_user.folders<<folder
		AddHeaders::to_this folder.flows.first.documents.first.pages.first
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
		params.require(:folder).permit :name,:open,:folder_id
	end

end