class GoogleAuth < ActiveRecord::Base
	belongs_to :user
	validates_uniqueness_of :google_id,:user_id
	validates_presence_of :user_id
end
