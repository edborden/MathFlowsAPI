class Group < ActiveRecord::Base

	has_many :users, after_remove: :destroy_if_empty
	validates_presence_of :name,:users_count

	def has_write_access? user
		users.include? user
	end

	def destroy_if_empty user = nil
		destroy if users(true).empty?
	end

end
