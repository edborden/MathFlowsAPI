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
		page.child_positions<<block_position({row_span:3,col_span:2})
		return page
	end

	def block_position position_params=nil,block_params=nil
		position = BlockPosition.create position_params
		block = block block_params
		block.positions<<position
		return position
	end

	def block block_params=nil
		block = Block.create block_params
		if block.question
			block.child_positions<<snippet_position(question_snippet_1_params,question_snippet_1_position_params)
			block.child_positions<<snippet_position(question_snippet_2_params,question_snippet_2_position_params)
		else
			block.child_positions<<snippet_position(directions_snippet_params,directions_snippet_position_params) 
		end
		return block
	end

	def snippet_position snippet_params,position_params
		position = SnippetPosition.create(position_params)
		snippet = Snippet.create(snippet_params)
		snippet.position = position
		return position
	end

	def question_snippet_1_params
		{question_number:true}
	end

	def question_snippet_1_position_params
		{row_span:1,col_span:3}
	end

	def question_snippet_2_params
		{question_number:false,content:"[Add question here.]"}
	end

	def question_snippet_2_position_params
		{row_span:1,col_span:10,col:4,row:1}
	end

	def directions_snippet_params
		{question_number:false,content:"[Add directions here.]"}
	end

	def directions_snippet_position_params
		{row_span:1,col_span:15,row:1,col:2}
	end
end