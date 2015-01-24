class Folder < ActiveRecord::Base
	belongs_to :user
	has_many :flows, dependent: :destroy

end
