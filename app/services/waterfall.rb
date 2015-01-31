class Waterfall
	include AddHeader

	def user mold
		user = User.create mold[:params]
		user.create_layout
		user.header = header(mold[:header_block])
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
		mold[:block_positions].each { |block_position| page.child_positions<<block_position(block_position) }
		return page
	end

	def block_position mold
		position = BlockPosition.create mold[:params]
		block = block mold[:block]
		block.positions<<position
		return position
	end

	def block mold
		block = Block.create mold[:params]
		mold[:snippet_positions].each { |snippet_position_mold| block.child_positions<<snippet_position(snippet_position_mold) }
		return block
	end

	def snippet_position mold
		position = SnippetPosition.create(mold[:params])
		snippet = snippet(mold[:snippet])
		snippet.position = position
		return position
	end

	def snippet mold
		snippet = Snippet.create(mold[:params])
		if snippet.has_image
			snippet.image = image(mold[:image])
		end
		if snippet.has_equation
			snippet.equation = equation(mold[:equation])
		end
		return snippet
	end

	def image mold
		image = Image.create(mold[:params])
		return image
	end

	def equation mold
		equation = Equation.create(mold[:params])
		equation.image = image(mold[:image])
		return equation
	end
end