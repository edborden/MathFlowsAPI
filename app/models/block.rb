class Block < ActiveRecord::Base
	belongs_to :page
	belongs_to :user
	has_one :image
	has_many :invalidations
	has_many :lines, -> { order(:position) }

	after_update :run_invalidator

	def run_invalidator
		if page.present? and page.test.present? #can only run if already part of the page. not compatible with waterfall.rb
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
