class Document < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	has_many :question_blocks, through: :pages
	belongs_to :flow

	after_create do
		pages<<Page.create
	end

end
