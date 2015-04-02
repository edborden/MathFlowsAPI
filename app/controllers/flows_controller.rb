class FlowsController < ResourceController
	include AddHeaders

	def create
		folder = Folder.find params[:flow][:folder_id]
		flow = Waterfall.new.flow(MasterMold.new.fresh_flow)
		folder.flows<<flow
		AddHeaders::to_this flow.documents.first.pages.first
		render json: flow.reload
	end

	def resource_params
		params.require(:flow).permit :name,:open,:folder_id
	end

end