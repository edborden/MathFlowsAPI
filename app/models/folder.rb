class Folder < ActiveRecord::Base
	belongs_to :user
	has_many :flows

	after_create do 
		flows<<Flow.create
	end

end
