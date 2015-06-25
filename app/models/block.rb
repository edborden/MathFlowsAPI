class Block < ActiveRecord::Base
	belongs_to :test
	belongs_to :page
	belongs_to :user #if it's a header
	has_one :image, dependent: :destroy
	has_many :invalidations, dependent: :destroy
	has_many :lines, -> { order(:position) }, dependent: :destroy

	after_update :run_invalidator

	def run_invalidator
		if test.present? && page.present? #can only run if already part of the page. not compatible with waterfall.rb
			lines_height = Invalidator.new(self).run
			unless self.lines_height == lines_height
				update_column "lines_height",lines_height
			end
			reload
		end
	end

	amoeba do
		enable
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
