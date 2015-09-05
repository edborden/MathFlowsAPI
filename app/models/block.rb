class Block < ActiveRecord::Base
	belongs_to :page
	belongs_to :user
	has_one :image, dependent: :destroy
	has_many :invalidations, dependent: :destroy
	has_many :lines, -> { order(:position) }, dependent: :destroy
	has_one :test, through: :page
	has_one :table, dependent: :destroy

	validates_presence_of :kind,:col_span,:row_span,:lines_height
	validates :user_id, presence: true, on: :create

	enum kind: [:question,:directions,:header]

	after_update :run_invalidator

	scope :valid, -> {where("id NOT IN (SELECT block_id FROM invalidations)")} #this doesn't work on an association (page.blocks.valid)
	scope :question, -> { where(kind:0) }
	scope :valid_question, -> { question.valid }
	scope :header, -> { where(kind:2) }

	def run_invalidator
		lines_height = Invalidator.new(self).run
		unless self.lines_height == lines_height
			update_column "lines_height",lines_height
			reload
		end
	end

	def content_invalidation 
		invalidations.where(message:0).take
	end

	def position_invalidation
		invalidations.where(message:1).take
	end

	amoeba do
		enable
	end

	def has_write_access? test_user
		[page.try(:test).try(:user),user].include? test_user
	end

	def set_owner user
		self.user_id = user.id
	end

	def attrs_set?
		row and col
	end

	def x
		col*COL_WIDTH + col*INSIDE_MARGIN if attrs_set?
	end

	def y
		row*ROW_HEIGHT + row*INSIDE_MARGIN if attrs_set?
	end

	def width
		col_span * COL_WIDTH + total_inside_margin_width
	end

	def height
		row_span * ROW_HEIGHT + total_inside_margin_height
	end

	def total_inside_margin_height
		(row_span-1) * INSIDE_MARGIN
	end

	def total_inside_margin_width
		(col_span-1) * INSIDE_MARGIN
	end

end
