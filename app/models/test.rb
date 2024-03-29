class Test < ActiveRecord::Base

  before_destroy :save_valid_question_blocks

  has_many :pages, -> { order(:id) }, dependent: :destroy
  belongs_to :folder
  belongs_to :user, counter_cache: true
  has_many :blocks, through: :pages

  validates_presence_of :user_id,:name

  amoeba do
    include_association :pages
    append :name => " Copy"
  end

  def save_valid_question_blocks
    blocks.question.each do |block|
      unless block.content_invalid
        block.page_id = nil
        block.user_id = nil
        block.row = nil
        block.col = nil
        block.save
      end
    end
  end

  def has_write_access? test_user
    test_user.id == user.id
  end

  def has_read_access? test_user
    if user.group_id
        user.group.users.include? test_user
    else
      false
    end
  end

end
