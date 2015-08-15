class UserSerializer < ApplicationSerializer
	attributes :guest,:name,:pic,:email,:created_at,:uservoice_token,:tests_count,:tests_quota
	has_many :folders, embed: :ids, include: :true
	has_many :blocks, embed: :ids, include: :true
	has_one :group, embed: :ids, include: :true
	has_one :preference, embed: :ids, include: :true
	has_many :groupvitations, embed: :ids, include: :true
	has_many :groupvitations_sent, embed: :ids, include: :true, root: "groupvitations"

	def guest
		object.plan.guest?
	end
end
