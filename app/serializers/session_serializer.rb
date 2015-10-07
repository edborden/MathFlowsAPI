class SessionSerializer < ApplicationSerializer
  attributes :token
  has_one :user, embed: :ids, include: :true
end