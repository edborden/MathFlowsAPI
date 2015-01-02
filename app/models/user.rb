class User < ActiveRecord::Base

	has_one :session
	has_many :grids

	def token
		try(:session).try(:token)
	end

end
