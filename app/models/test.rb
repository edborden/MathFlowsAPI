class Test < ActiveRecord::Base

	before_destroy :save_valid_blocks

	has_many :pages, dependent: :destroy
	belongs_to :folder
	belongs_to :user, counter_cache: true
	has_many :blocks, through: :pages

	validates_presence_of :user_id,:folder_id,:name

	amoeba do
		include_association :pages
		append :name => " Copy"
	end

	def save_valid_blocks
		blocks.question.each do |block|
			unless block.invalidations.exists?
				block.page_id = nil
				block.user_id = nil
				block.save
			end
		end
	end

end
