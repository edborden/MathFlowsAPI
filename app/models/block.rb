class Block < ActiveRecord::Base
  include ProcessedContent

  belongs_to :page
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :lines, -> { order(:position) }, as: :lineable, dependent: :destroy
  has_one :test, through: :page
  has_many :tables, dependent: :destroy

  validates_presence_of :kind,:col_span,:row_span
  validates :user_id, presence: true, on: :create

  enum kind: [:question,:directions,:header]

  scope :valid, -> {where(content_invalid:false)}
  scope :question, -> { where(kind:0) }
  scope :valid_question, -> { question.valid }
  scope :header, -> { where(kind:2) }

  amoeba do
    exclude_association :tables
    customize(lambda { |original_block,new_block|
      original_block.tables.each {|table| TableCopy.new(table,new_block) }
    })
  end

  def has_write_access? test_user
    [page.try(:test).try(:user_id),user_id].include? test_user.id
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
    unsorted = tables + images
    sorted = unsorted.sort { |child1,child2| child1.block_position <=> child2.block_position }
    #if question?
      #questionNumber = QuestionNumber.new(self)
      #p questionNumber.width
      #sorted.unshift LinesGroup.new(lines,width-questionNumber.width) if lines.present?
      #sorted.unshift questionNumber
    #else
      #sorted.unshift LinesGroup.new(lines,0) if lines.present?
    #end

    return sorted
  end

end
