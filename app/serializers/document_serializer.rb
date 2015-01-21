class DocumentSerializer < ApplicationSerializer
	has_many :pages
	has_one :flow
end
