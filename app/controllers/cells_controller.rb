class CellsController < ResourceController

  def create
    if_authorized {super}
  end

  def resource_params
    params.require(:cell).permit :row_id,:col_id,:table_id
  end

end
