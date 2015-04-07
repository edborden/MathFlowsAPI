class Test < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	belongs_to :folder

	amoeba do
		enable
	end

end
