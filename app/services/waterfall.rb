class Waterfall
	include AddHeader

	def user mold
		user = User.create mold[:params]
		user.create_layout
		#user.header = header(mold[:header_block])
		user.save
		mold[:folders].each { |folder_mold| user.folders<<folder(folder_mold) }
		return user
	end

	def header mold
		header = block(mold)
		AddHeader.add_position_to header
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
		if mold[:images]
			mold[:images].each { |image_mold| block.images<<image(image_mold) }
		end
		return block
	end

	def image mold
		image = Image.create(mold[:params])
		return image
	end

end