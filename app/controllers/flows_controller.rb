class FlowsController < ApplicationController

	def create
		folder = Folder.find params[:flow][:folder_id]
		flow = folder.flows.create
		render json: flow
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