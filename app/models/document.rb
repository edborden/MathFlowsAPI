class Document < ActiveRecord::Base
	has_many :pages
	belongs_to :flow

	after_create do
		pages<<Page.create
	end
end
