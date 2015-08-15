class Test < ActiveRecord::Base
	has_many :pages
	belongs_to :folder
	belongs_to :user, counter_cache: true
	has_many :blocks, through: :pages

	amoeba do
		include_association :pages
		append :name => " Copy"
	end

end
