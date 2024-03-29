class BlocksController < ResourceController
  skip_before_action :current_user_read_authorized?, only: :copy

  def create
      @resource = model.new resource_params
      resource_params[:page_id] = nil if header?
      if header? || @resource.has_write_access?(current_user)
        @resource.try :set_owner,current_user
        super
      else
        head :forbidden
      end
  end

  def copy
    @resource = BlockCopy.new(@resource,current_user).block
    render_resource_or_errors    
  end

  def validate
    Validate.new resource
    render_resource
  end

  def resource_params
    params.require(:block).permit :row,:col,:col_span,:row_span,:page_id,:kind
  end

  def header?
    resource_params[:kind] == "header"
  end

end
