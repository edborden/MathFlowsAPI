class User < ActiveRecord::Base

	has_one :session
	has_many :layouts

	def token
		try(:session).try(:token)
	end

end
