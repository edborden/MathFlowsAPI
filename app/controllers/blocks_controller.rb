class BlocksController < ResourceController

	def create
		copy_from = params[:block][:copy_from_id]
		if copy_from
			@resource = BlockCopy.new(copy_from,current_user).block
			render_resource
		else
			@resource = model.new resource_params
			if @resource.has_write_access? current_user
				@resource.set_owner current_user
				if @resource.save
					line = Line.new position:1
					@resource.lines<<line
					render_resource
				else
					render_errors
				end
			else
				head :forbidden
			end

		end
	end

	def resource_params
		params.require(:block).permit :question,:row,:col,:col_span,:row_span,:page_id,:header
	end

end
