class GroupvitationsController < ResourceController

  def create
    receiver = User.find_by_email params[:groupvitation][:receiver_email]
    if receiver
      if current_user.group == receiver.group
        new_resource.errors.add :receiver_email, "already in group"
      else
        new_resource.receiver_id = receiver.id
      end
    end
    super
  end

  def accept
    group = Accept.new(current_user,@resource).group
    render json: group
  end

  def decline
    Decline.new @resource
    head :no_content
  end

  def resource_params
    params.require(:groupvitation).permit :receiver_email
  end

end