class GroupSerializer < ApplicationSerializer
  attributes :name
  has_many :users, embed: :ids, include: :true, serializer: ColleagueSerializer

  def users
    object.users - [current_user]
  end

end