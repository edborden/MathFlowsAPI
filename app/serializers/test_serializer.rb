class TestSerializer < ApplicationSerializer
	attributes :name
	has_many :pages,embed_in_root:true
	has_one :folder
end
