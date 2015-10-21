class Preference < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id

  def has_write_access? test_user
    user_id == test_user.id
  end
end