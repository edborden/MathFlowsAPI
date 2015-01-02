class Session < ActiveRecord::Base
	belongs_to :user

	def issue_token
		self.token = SecureRandom.hex
		save
	end

end