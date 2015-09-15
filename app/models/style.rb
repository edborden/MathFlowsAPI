class Style < ActiveRecord::Base

	belongs_to :line
	validates_presence_of :line, :effect
	enum effect: [:bold,:italic,:underline,:red]

	def has_write_access? user
		line.lineable.user == user
	end

end