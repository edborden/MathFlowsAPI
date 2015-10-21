class GroupSerializer < ApplicationSerializer
  attributes :name
  has_many :users, embed: :ids, include: :true

  def users
    object.users - [current_user]
  end

end