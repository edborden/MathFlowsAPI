class UserSerializer < ApplicationSerializer
	attributes :guest,:name,:pic,:premium,:email,:created_at,:uservoice_token
	has_many :folders, embed: :ids, include: :true
	has_many :blocks, embed: :ids, include: :true
	has_one :group, embed: :ids, include: :true
	has_one :preference, embed: :ids, include: :true
end
