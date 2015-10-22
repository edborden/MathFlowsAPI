class Group < ActiveRecord::Base

  has_many :users, after_remove: :destroy_if_empty
  validates_presence_of :name,:users_count

  scope :with_multiple_users, -> {where("users_count > 1")}

  def has_write_access? test_user
    users.include? test_user
  end

  def destroy_if_empty user = nil
    destroy if users(true).empty?
  end

end
