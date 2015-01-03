class LayoutsController < ApplicationController

	def create
		layout = Layout.create
		render json: layout
	end

	def show
		layout = Layout.find params[:id]
		render json: layout
	end

	def destroy
		layout = Layout.find params[:id]
		layout.destroy
		head :ok
	end

end
