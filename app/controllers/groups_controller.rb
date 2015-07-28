class GroupsController < ResourceController

	def create
		group = Group.create resource_params
		group.users<<current_user
		render json: group.reload
	end

	def destroy
		@resource.users.delete current_user
		unless @resource.users(true).present?
			@resource.destroy
		end
		head :no_content
	end

	def resource_params
		params.require(:group).permit :name
	end

end