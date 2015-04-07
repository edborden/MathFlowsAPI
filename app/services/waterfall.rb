class Waterfall

	def user mold
		user = User.create mold[:params]
		mold[:headers].each { |header_mold| user.headers<<block(header_mold) }
		mold[:folders].each { |folder_mold| user.folders<<folder(folder_mold) }
		return user
	end

	def folder mold
		folder = Folder.create mold[:params]
		mold[:tests].each { |test_mold| folder.tests<<test(test_mold) }
		return folder
	end

	def test mold
		test = Test.create mold[:params]
		mold[:pages].each { |page_mold| test.pages<<page(page_mold) }
		return test
	end

	def page mold
		page = Page.create mold[:params]
		mold[:blocks].each { |block_mold| page.blocks<<block(block_mold) }
		return page
	end

	def block mold
		block = Block.create mold[:params]
		if mold[:image]
			block.image = image(mold[:image])
		end
		return block
	end

	def image mold
		image = Image.create(mold[:params])
		return image
	end

end