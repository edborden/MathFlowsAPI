class BlocksController < ResourceController

	def create
		if params[:block][:copy_from_id]
			copy_from = Block.find params[:block][:copy_from_id]
			@resource = copy_from.amoeba_dup
			@resource.page_id = nil
			@resource.col = nil
			@resource.row = nil
			@resource.save
			render_resource
		else
			super
		end
	end

	def update
		if @resource.update resource_params
			Invalidator.new(@resource).run
			render_resource
		else
			render_errors
		end		
	end

	def resource_params
		params.require(:block).permit :content,:question,:row,:col,:col_span,:row_span,:user_id,:page_id,:test_id
	end

end
