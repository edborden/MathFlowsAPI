class TablesController < ResourceController

	def create
		if_authorized {super}
	end

	def resource_params
		params.require(:table).permit :block_id,:rows_count,:cols_count,:block_position
	end

end
