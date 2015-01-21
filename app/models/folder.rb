class Folder < ActiveRecord::Base
	belongs_to :user
	has_many :flows, dependent: :destroy

	after_create do 
		flows<<Flow.create
	end

end
