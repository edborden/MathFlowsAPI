class GroupsController < ApplicationController

	def create
		group = Group.create
		group.users<<current_user
		render json: group.reload
	end

	def update
		group = Group.update params[:id],group_params
		render json: group
	end

	def destroy
		group = Group.find params[:id]
		group.users.delete current_user
		unless group.users(true).present?
			group.destroy
		end
		head :no_content
	end

	def group_params
		params.require(:group).permit :name
	end

end