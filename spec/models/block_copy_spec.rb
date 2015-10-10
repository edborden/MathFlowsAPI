describe BlockCopy do

  include_context "user_with_block"

  context "without images or tables" do
    
    before do
      @other_user = create :user
      create :line, lineable:block
      @copy = BlockCopy.new block,@other_user
    end

    it "creates a new block" do
      block = @copy.block
      lines = block.lines
      expect(@copy.block.is_a? Block).to be_truthy
      expect(@copy.block.errors.empty?).to be_truthy
    end

    it "saves block" do
      expect(Block.count).to eq 2
    end

    it "creates copied block and sets to current_user" do
      expect(@other_user.blocks.first).to eq Block.last
    end

    it "copies lines" do
      expect(@other_user.blocks.first.lines.first).to be_truthy
    end

  end

  context "with image" do

    before do
      create :image, block:block
      @other_user = create :user
      @copy = BlockCopy.new block,@other_user
    end

    it "saves block" do
      expect(Block.count).to eq 2
    end

    it "copies image" do
      expect(@other_user.blocks.first.images.first).to be_truthy
    end

  end

  context "with table" do

    before do
      create :table_with_content, block:block
      @other_user = create :user
      @copy = BlockCopy.new block,@other_user
    end

    it "saves block" do
      expect(Block.count).to eq 2
    end

    it "copies table" do
      expect(@other_user.blocks.first.tables.first).to be_truthy
    end

  end

end