describe BlockCopy do

	include_context "eager_user_with_block"

	before do
		block
		@other_user = create :user
		block.lines.first.content = "test!"
		block.lines.first.save
		@copy = BlockCopy.new block.id,@other_user
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
		expect(@other_user.blocks.first.lines.first.content).to eq Block.last.lines.first.content
	end

end