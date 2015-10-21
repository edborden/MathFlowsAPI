class Page < ActiveRecord::Base
  has_many :blocks, dependent: :destroy
  belongs_to :test

  amoeba {enable}

  def has_write_access? test_user
    test.user_id == test_user.id
  end

  def has_read_access? test_user
    if test.user.group_id
        test.user.group.users.include? test_user
    else
      false
    end
  end

end