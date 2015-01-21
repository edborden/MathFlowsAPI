class User < ActiveRecord::Base

	has_one :session
	has_many :folders

	after_create do 
		create_session
		folders<<Folder.create
	end

	def token
		try(:session).try(:token)
	end

	def self.create_from_google google
		userinfo = google.userinfo
		create! do |user|
			user.name = userinfo.name
			user.email = userinfo.email
			user.gender = userinfo.gender
			user.pic = userinfo.picture
			user.google_id = userinfo.id
			user.google_link = userinfo.link
			user.google_refresh = google.authorization.refresh_token
			user.guest = false
		end
	end

end
