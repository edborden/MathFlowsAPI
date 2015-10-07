class LinesController < ResourceController

  def create
    if params[:line][:block_id]
      new_resource.lineable_id = params[:line][:block_id]
      resource.lineable_type = "Block"
    else
      new_resource.lineable_id = params[:line][:cell_id]
      resource.lineable_type = "Cell"
    end     
    if_authorized {super}
  end

  def resource_params
    params.require(:line).permit :content, :position
  end

end
