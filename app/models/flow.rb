class Flow < ActiveRecord::Base
	has_many :documents
	has_one :layout, as: :layoutable
	belongs_to :user

	def self.create_default
		flow = Flow.create
		document = Document.create_default
		flow.documents<<document
		flow.create_layout
		flow
	end
end
