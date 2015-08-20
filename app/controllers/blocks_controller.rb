class BlocksController < ResourceController

	def create
		copy_from = params[:block][:copy_from_id]
		if copy_from
			@resource = BlockCopy.new(copy_from,current_user).block
			render_resource
		else
			@resource = model.new resource_params
			resource_params[:page_id] = nil if header?
			if header? || @resource.has_write_access?(current_user)
				@resource.try :set_owner,current_user
				if @resource.save
					Line.create position:1,block_id:@resource.id
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
		params.require(:block).permit :row,:col,:col_span,:row_span,:page_id,:kind
	end

	def header?
		resource_params[:kind] == "header"
	end

end
