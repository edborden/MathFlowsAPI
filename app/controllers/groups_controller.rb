class GroupsController < ResourceController
  skip_before_action :resource_exists?, only: :unjoin
  skip_before_action :current_user_write_authorized?, only: :unjoin

  def create
    group = Group.create resource_params
    group.users<<current_user
    render json: group.reload
  end

  def unjoin
    Unjoin.new current_user
    head :no_content
  end

  def resource_params
    params.require(:group).permit :name
  end

end