class Page < ActiveRecord::Base
  has_many :blocks, dependent: :destroy
  belongs_to :test

  amoeba {enable}

  def has_write_access? user
    test.user_id == user.id
  end
end