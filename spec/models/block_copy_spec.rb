require 'rails_helper'

describe BlockCopy do

	include_context "user_with_block"

	before do
		line
		@other_user = create :user
		block.lines.first.content = "test!"
		block.lines.first.save
		BlockCopy.new block.id,@other_user
	end

	it "creates copied block and sets to current_user" do
		expect(@other_user.blocks.first).to eq Block.last
	end

	it "copies lines" do
		expect(@other_user.blocks.first.lines.first.content).to eq Block.last.lines.first.content
	end

end