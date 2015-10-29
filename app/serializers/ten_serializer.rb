class TenSerializer < ApplicationSerializer
  attributes :name,:pic,:email,:created_at,:tests_count,:token

  def token
    object.session.try :token
  end
end