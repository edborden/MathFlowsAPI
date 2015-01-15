class Flow < ActiveRecord::Base
	has_many :documents
	has_one :layout, as: :layoutable, class_name: "FlowLayout"
	belongs_to :user

	def self.create_default
		flow = Flow.create
		layout = FlowLayout.default
		flow.layout = layout
		document = Document.create_default
		flow.documents<<document
		return flow
	end
end
