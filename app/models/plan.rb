class Plan < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :user_id,:level
	enum level: [:guest,:basic]

	scope :not_guest, -> {where.not(level:0)}

end
