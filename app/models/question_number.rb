class QuestionNumber < Snippet

  def initialize block
    @block = block
    @page = block.page
    @test = @page.try :test
    styles = [Style.new(effect: :bold)]
    super string,styles,:top
  end

  def index
    @index ||= begin
      if @page && @test
        question_blocks_sorted(@test).index(@block) + 1
      else
        0
      end
    end
  end

  def string
    index.to_s + ")  "
  end

  def question_blocks page
    page.blocks.order("row ASC, col ASC").select {|block| block.question?}
  end

  def question_blocks_sorted test
    ar = []
    test.pages.each do |page|
      ar.push question_blocks(page)
    end
    ar.flatten
  end

end