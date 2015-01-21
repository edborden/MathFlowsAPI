class Flow < ActiveRecord::Base
	has_many :documents
	has_one :layout
	belongs_to :folder

	after_create do 
		create_layout
		documents<<Document.create
	end

end
