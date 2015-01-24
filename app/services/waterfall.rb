class Waterfall

	def user
		user = User.create
		user.folders<<folder
		return user
	end

	def folder
		folder = Folder.create
		folder.flows<<flow
		return folder
	end

	def flow
		flow = Flow.create 
		flow.create_layout
		flow.documents<<document
		return flow
	end

	def document
		document = Document.create
		document.pages<<page
		return document
	end

	def page
		page = Page.create
		page.child_positions<<block_position
		return page
	end

	def block_position position_params=nil,block_params=nil
		position = Position.create position_params
		block = block block_params
		block.positions<<position
		return position
	end

	def block block_params=nil
		block = Block.create block_params
		if block.question
			snippet_params = {question_number:true}
		else
			snippet_params = {question_number:false}
		end
		block.child_positions<<snippet_position(snippet_params)
		return block
	end

	def snippet_position snippet_params=nil
		position = Position.create
		snippet = Snippet.create(snippet_params)
		snippet.position = position
		return position
	end
end