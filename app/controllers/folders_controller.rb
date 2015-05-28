class FoldersController < ResourceController

	def resource_params
		params.require(:folder).permit :name,:open,:folder_id,:test_folder,:student_folder,:user_id
	end

end