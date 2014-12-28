class User < ActiveRecord::Base

	has_one :session

	def token
		try(:session).try(:token)
	end

end
