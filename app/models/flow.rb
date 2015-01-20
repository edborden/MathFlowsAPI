class Flow < ActiveRecord::Base
	has_many :documents
	has_one :layout
	belongs_to :folder

	def self.create_default
		flow = Flow.create
		layout = Layout.default
		flow.layout = layout
		document = Document.create_default
		flow.documents<<document
		return flow
	end
end
