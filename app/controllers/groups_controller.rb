class GroupsController < ApplicationController

	def create
		group = Group.create group_params
		group.users<<current_user
		render json: group.reload
	end

	def update
		group = Group.update params[:id],group_params
		render json: group
	end

	def group_params
		params.require(:group).permit :name
	end

end