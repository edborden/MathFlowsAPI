class Waterfall

	def user mold
		user = User.create mold[:params]
		user.create_layout
		mold[:headers].each { |header_mold| user.headers<<header(header_mold) }
		mold[:folders].each { |folder_mold| user.folders<<folder(folder_mold) }
		return user
	end

	def header mold
		header = position(mold)
		return header
	end

	def folder mold
		folder = Folder.create mold[:params]
		mold[:flows].each { |flow_mold| folder.flows<<flow(flow_mold) }
		return folder
	end

	def flow mold
		flow = Flow.create mold[:params]
		mold[:documents].each { |document_mold| flow.documents<<document(document_mold) }
		return flow
	end

	def document mold
		document = Document.create mold[:params]
		mold[:pages].each { |page_mold| document.pages<<page(page_mold) }
		return document
	end

	def page mold
		page = Page.create mold[:params]
		mold[:positions].each { |position_mold| page.positions<<position(position_mold) }
		return page
	end

	def position mold
		position = Position.create mold[:params]
		block = block mold[:block]
		block.positions<<position
		return position
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