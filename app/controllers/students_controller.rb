class StudentsController < ResourceController

	def resource_params
		params.require(:student).permit :name,:email,:folder_id
	end

end
