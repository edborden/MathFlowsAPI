class Page < ActiveRecord::Base
	has_many :positions, dependent: :destroy
	belongs_to :document
	has_many :blocks, through: :positions

	def layout
		document.flow.folder.user.layout
	end

	amoeba do
		enable
	end

end
