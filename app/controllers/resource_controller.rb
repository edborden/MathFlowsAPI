class ResourceController < AuthenticatedController
	before_action :set_resource, except: :create

	def model
		controller_name.classify.constantize
	end

	def set_resource
		@resource = model.find params[:id]
	end

	def create
		@resource = model.new resource_params
		if @resource.save
			render_resource
		else
			render_errors
		end		
	end

	def show
		if @resource
			render_resource
		else
			render json: {errors:{resource: [model.to_s + " doesn't exist."]}}, status: :unprocessable_entity
		end
	end

	def update
		if @resource.update resource_params
			render_resource
		else
			render_errors
		end		
	end

	def destroy
		@resource.destroy
		head :no_content
	end

	def render_resource
		render json: @resource
	end

	def render_errors
		render json: {errors: @resource.errors}, status: :unprocessable_entity
	end

end