class UserSerializer < ApplicationSerializer
	attributes :guest,:name,:pic,:email,:created_at,:uservoice_token,:tests_count,:tests_quota,:referred_by
	has_many :folders, embed: :ids, include: :true
	has_many :blocks, embed: :ids, include: :true
	has_one :group, embed: :ids, include: :true
	has_one :preference, embed: :ids, include: :true
	has_many :groupvitations_sent, embed: :ids
	has_many :groupvitations, embed: :ids
	has_many :groupvitations_all, embed: :ids, include: :true, root: "groupvitations"
	has_many :invitations_sent, embed: :ids, include: true, root: "invitations"

	def groupvitations_all
		object.groupvitations + object.groupvitations_sent
	end

	def guest
		object.plan.guest?
	end
end
