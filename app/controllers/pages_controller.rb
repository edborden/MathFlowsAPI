class PagesController < ResourceController

  def create
    if_authorized {super}
  end

  def resource_params
    params.require(:page).permit :test_id
  end

end