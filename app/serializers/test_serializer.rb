class TestSerializer < ApplicationSerializer
	attributes :name
	has_many :pages, embed: :ids, include: :true
	has_many :blocks, embed: :ids, include: :true
	has_one :folder
end
