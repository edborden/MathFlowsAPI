class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :tests, -> { order(:name) },dependent: :destroy
  has_many :folders #don't dependent: :destroy -- UI won't work in real-time
  belongs_to :folder

  enum contents: [:tests]

  validates_presence_of :user_id,:name,:contents

  def has_write_access? test_user
    user_id == test_user.id
  end

  def set_owner user
    self.user_id = user.id
  end
end