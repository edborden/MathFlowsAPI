class Test < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	has_many :blocks, dependent: :destroy
	belongs_to :folder

	amoeba do
		enable
	end

end
