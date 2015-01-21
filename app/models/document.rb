class Document < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	belongs_to :flow

	after_create do
		pages<<Page.create
	end
end
