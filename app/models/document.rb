class Document < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	belongs_to :flow

	amoeba do
		enable
	end

end
