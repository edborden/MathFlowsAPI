class Plan < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id,:level
  validates :user_id, uniqueness: true, on: :create
  enum level: [:guest,:basic]

  scope :not_guest, -> {where.not(level:0)}
  scope :guest, -> {where(level:0)}

  def destroy_guest_user
    user.destroy_blocks_then_destroy
  end

end
