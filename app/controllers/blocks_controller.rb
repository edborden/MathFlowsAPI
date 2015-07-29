class BlocksController < ResourceController

	def create
		if params[:block][:copy_from_id]
			copy_from = Block.find params[:block][:copy_from_id]
			@resource = copy_from.amoeba_dup
			@resource.user_id = current_user.id
			@resource.page_id = nil
			@resource.col = nil
			@resource.row = nil
			@resource.save
			render_resource
		else
			@resource = model.new resource_params
			if @resource.save
				line = Line.new position:1
				@resource.lines<<line
				render_resource
			else
				render_errors
			end
		end
	end

	def resource_params
		params.require(:block).permit :question,:row,:col,:col_span,:row_span,:user_id,:page_id,:header
	end

end
