class Plan < ActiveRecord::Base
	belongs_to :user
	enum level: [:guest,:basic]

	scope :not_guest, -> {where.not(level:0)}

end
