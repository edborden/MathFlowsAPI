class Waterfall

	def user mold
		user = User.create mold[:params]
		mold[:blocks].each { |block_mold| user.blocks<<block(block_mold) }
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
		mold[:pages].each do |page_mold| 
			p = page(page_mold)
			test.pages<<p
			p.blocks.each { |block| test.blocks<<block }
		end
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