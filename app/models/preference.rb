class Preference < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id

  def has_write_access? test_user
    test_user == user
  end
end