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

	def set_attrs_from_google google
		userinfo = google.userinfo
		self.name = userinfo.name
		self.email = userinfo.email
		self.gender = userinfo.gender
		self.pic = userinfo.picture
		self.google_id = userinfo.id
		self.google_link = userinfo.link
		self.google_refresh = google.authorization.refresh_token
		self.guest = false
		save
		return self
	end

end
