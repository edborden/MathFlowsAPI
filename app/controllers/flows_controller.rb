class FlowsController < ApplicationController
	include AddHeaders

	def create
		folder = Folder.find params[:flow][:folder_id]
		flow = Waterfall.new.flow(MasterMold.new.fresh_flow)
		folder.flows<<flow
		AddHeaders::to_this flow.documents.first.pages.first
		render json: flow.reload
	end

	def update
		flow = Flow.update params[:id],flow_params
		render json: flow
	end

	def destroy
		flow = Flow.find params[:id]
		flow.destroy
		head :no_content
	end

	def flow_params
		params.require(:flow).permit :name
	end

end