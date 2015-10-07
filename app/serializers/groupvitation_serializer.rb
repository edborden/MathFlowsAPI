class GroupvitationSerializer < ApplicationSerializer
  attributes :receiver_email,:group_name,:sender_name,:created_at,:updated_at,:status

  def group_name
    object.sender.group.name
  end

  def sender_name
    object.sender.name
  end

end