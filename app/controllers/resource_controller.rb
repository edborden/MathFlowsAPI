class ResourceController < AuthenticatedController
  before_action :resource_exists?, except: :create
  before_action :current_user_write_authorized?, except: [:create,:show,:copy]
  before_action :current_user_read_authorized?, only: [:show,:copy]

  def current_user_write_authorized?
    head :forbidden unless resource.has_write_access? current_user
  end

  def current_user_read_authorized?
    head :forbidden unless resource.has_write_access?(current_user) || resource.try(:has_read_access?,current_user)
  end

  def resource_exists?
    head :not_found unless resource
  end

  def model
    controller_name.classify.constantize
  end

  def new_resource
    @resource ||= model.new resource_params
    resource.try :set_owner,current_user
    return resource 
  end

  def resource
    @resource ||= model.find params[:id]
  end

  def create
    if new_resource.errors.empty? && new_resource.save
      render_resource
    else
      render_errors
    end   
  end

  def if_authorized
    @resource ||= model.new resource_params
    if resource.has_write_access? current_user
      yield
    else
      head :forbidden
    end
  end

  def show
    if resource
      render_resource
    else
      render json: {errors:{resource: [model.to_s + " doesn't exist."]}}, status: :unprocessable_entity
    end
  end

  def update
    if resource.update resource_params
      render_resource
    else
      render_errors
    end   
  end

  def destroy
    if resource.destroy
      head :no_content
    else
      head :unprocessable_entity
    end
  end

  def render_resource_or_errors
    if @resource.errors.empty?
      render_resource
    else
      render_errors
    end
  end

  def render_resource
    render json: resource
  end

  def render_errors
    render json: {errors: resource.errors}, status: :unprocessable_entity
  end

end