class DocumentSerializer < ApplicationSerializer
	attributes :name
	has_many :pages,embed_in_root:true
	has_one :flow
end
