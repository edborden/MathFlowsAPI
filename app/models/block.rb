class Block < ActiveRecord::Base
	include ProcessedContent

	belongs_to :page
	belongs_to :user
	has_many :images, dependent: :destroy
	has_many :invalidations, dependent: :destroy
	has_many :lines, -> { order(:position) }, dependent: :destroy
	has_one :test, through: :page
	has_many :tables, dependent: :destroy

	validates_presence_of :kind,:col_span,:row_span
	validates :user_id, presence: true, on: :create

	enum kind: [:question,:directions,:header]

	after_update :run_invalidator

	scope :valid, -> {where("id NOT IN (SELECT block_id FROM invalidations)")} #this doesn't work on an association (page.blocks.valid)
	scope :question, -> { where(kind:0) }
	scope :valid_question, -> { question.valid }
	scope :header, -> { where(kind:2) }

	def run_invalidator
		Invalidator.new(self).run
	end

	def children
		unsorted = tables + images
		unsorted.sort { |child1,child2| child1.block_position <=> child2.block_position }
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

	def processed_content
		children
	end

end
