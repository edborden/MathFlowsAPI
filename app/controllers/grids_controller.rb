class GridsController < ApplicationController

	def create
		grid = Grid.create
		render json: grid
	end

	def show
		grid = Grid.find params[:id]
		render json: grid
	end

	def destroy
		grid = Grid.find params[:id]
		grid.destroy
		head :ok
	end

end
