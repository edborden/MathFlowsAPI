class Session < ActiveRecord::Base
  belongs_to :user
  before_validation :issue_token, on: :create

  validates_presence_of :user_id,:token

  def issue_token
    self.token = SecureRandom.hex(16)
  end

end