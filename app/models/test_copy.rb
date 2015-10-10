class TestCopy
  attr_accessor :test

  def initialize copy_from,user

      @test = copy_from.amoeba_dup

      unless copy_from.user_id == user.id

        @test.user_id = user.id
        @test.folder_id = nil

        @test.pages.each do |page|
          page.blocks.each do |block|
            block.user_id = user.id
          end
        end

      end

      @test.save

  end

end