class FoldersController < ResourceController

	def resource_params
		params.require(:folder).permit :name,:open,:folder_id,:contents
	end

end