class GroupvitationSerializer < ApplicationSerializer
	attributes :receiver_email,:group_name,:sender_name,:created_at,:updated_at,:declined,:accepted,:receiver_id

	def group_name
		object.sender.group.name
	end

	def sender_name
		object.sender.name
	end

end