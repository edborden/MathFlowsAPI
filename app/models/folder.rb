class Folder < ActiveRecord::Base
	belongs_to :user
	has_many :flows

	after_create :create_flow

	def create_flow
		flow = Flow.create_default
		flows<<flow
	end

end
