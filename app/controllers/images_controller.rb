class ImagesController < ResourceController

  def create
    if_authorized {super}
  end

  def resource_params
    params.require(:image).permit :cloudinary_id,:block_id,:width,:height,:block_position
  end

end
