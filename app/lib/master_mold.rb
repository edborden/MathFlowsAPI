class MasterMold

	def fresh_user
		{
			params:nil,
			folders: [intro_test],
			header_blocks: header_block
		}
	end

	def fresh_folder
		{
			params: nil,
			flows: [fresh_flow]
		}		
	end

	def fresh_flow
		{
			params: nil,
			documents: [fresh_document]
		}
	end

	def fresh_document
		{
			params: nil,
			pages: [fresh_page]
		}
	end

	def fresh_page
		{
			params: nil,
			positions: [default_position]
		}
	end

	def default_position
		{
			params: {row_span:3,col_span:2},
			block: default_block	
		}
	end

	def default_block
		{
			params: {question:true,content:"[Add content here.]"}
		}		
	end

	def header_block
		{
			params: {question:false},
			snippet_positions: [
				{
					params: {col:1,row:1,row_span:1,col_span:8},
					snippet: {
						params: {content:"Date: _________________________"}
					}
				},
				{
					params: {col:9,row:1,row_span:1,col_span:8},
					snippet: {
						params: {content:"Name: ____________________"}
					}
				},
				{
					params: {col:1,row:2,row_span:1,col_span:12},
					snippet: {
						params: {content:"Chapter 3 Test----------------"}
					}
				},
				{
					params: {col:9,row:2,row_span:1,col_span:12},
					snippet: {
						params: {content:"Ms. Smith---------------------"}
					}
				},
				{
					params: {col:1,row:3,row_span:1,col_span:12},
					snippet: {
						params: {content:"Algebra 2----------------------"}
					}
				}
			]
		}
	end

	def intro_test
		{
			params: {name:"My First Folder"},
			flows: [
				{
					params: {name:"Intro Test"},
					documents: [
						{
							params: nil,
							pages: [
								{
									params: nil,
									positions: [
										{
											params: {row_span:2,col_span:2,row:4,col:1},
											block: {
												params: {question:true,content:"Drag around and resize any block."}
											}
										},
										{
											params: {row_span:2,col_span:2,row:4,col:3},
											block: {
												params: {question:true,content:"Double click any block to edit it."}
											}
										},
										{
											params: {col:1,row:6,col_span:2,row_span:7},
											block: {
												params: {question:true,content:"You can add equations..."}
											}
										},
										{
											params: {col:3,row:6,col_span:2,row_span:7},
											block: {
												params: {question:true,content:"...and images."}
											}
										},
										{
											params: {col:1,row:13,col_span:4,row_span:2},
											block: {
												params: {question:false,content:"This is a directions block with no number. You can add it on the left menu of this page."}
											}
										},
										{
											params: {row_span:3,col_span:2,row:15,col:1},
											block: {
												params: {question:true,content:"Question blocks are automatically numbered for you, even across pages (you can also add pages on the left menu)."}
											}
										},
										{
											params: {row_span:3,col_span:2,row:15,col:3},
											block: {
												params: {question:true,content:"When you're done, get a pixel perfect PDF version with one click on the left."}
											}
										},
										{
											params: {row_span:2,col_span:4,row:18,col:1},
											block: {
												params: {question:true,content:"And once you login, you'll be able to make multiple versions of a test, with questions synchronized across versions. Check it out!"}
											}
										}
									]
								}
							]
						}
					]
				}
			]
		}
	end

end