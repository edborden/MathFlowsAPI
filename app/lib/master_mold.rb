class MasterMold

	def fresh_user
		{
			params:nil,
			folders: [intro_test],
			headers: default_headers
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

	def default_headers
		[
			{
				params: {col:1,row:1,row_span:1,col_span:2},
				block: {
					params: {
						question: false,
						content:"Date: _________________________"					
					}
				}
			},
			{
				params: {col:3,row:1,row_span:1,col_span:2},
				block: {
					params: {
						question: false,
						content:"Name: ____________________"					
					}
				}
			},
			{
				params: {col:1,row:2,row_span:1,col_span:2},
				block: {
					params: {
						question: false,
						content:"Chapter 3 Test"					
					}
				}
			},
			{
				params: {col:3,row:2,row_span:1,col_span:2},
				block: {
					params: {
						question: false,
						content:"Ms. Smith"					
					}
				}
			},
			{
				params: {col:1,row:3,row_span:1,col_span:2},
				block: {
					params: {
						question: false,
						content:"Algebra 2"					
					}
				}
			},
			{
				params: {col:3,row:3,row_span:1,col_span:2},
				block: {
					params: {
						question: false,
						content:"Period 5"					
					}
				}
			}
		]
	end

	def intro_test
		{
			params: {name:"My First Folder",flow_folder:true},
			flows: [
				{
					params: {name:"Intro Test"},
					documents: [
						{
							params: {name:"Version 1"},
							pages: [
								{
									params: nil,
									positions: default_headers + [
										{
											params: {row_span:3,col_span:2,row:4,col:1},
											block: {
												params: {question:true,content:"Drag around and resize any block."}
											}
										},
										{
											params: {row_span:3,col_span:2,row:4,col:3},
											block: {
												params: {question:true,content:"Edit text by clicking on it. Switch to math mode and insert equations with the '\\$' key. $f\\left(x\\right)=\\sqrt[3]{4}x+12$"}
											}
										},
										{
											params: {col:1,row:7,col_span:2,row_span:7},
											block: {
												params: {question:true,content:"Double click on any block to access its menu, which will allow you to add images..."},
												image: {params:{height:353,width:446,cloudinary_id:"block_images/v7bz2rx9bs65ecbhyf0n",scale:5}}
											}
										},
										{
											params: {col:3,row:7,col_span:2,row_span:7},
											block: {
												params: {question:true,content:"...or create graphs."},
												image: {params: {width:501,height:398,cloudinary_id:"block_images/eyjdrh6xrt2no9a2ezam",scale:5}}
											}
										},
										{
											params: {col:1,row:14,col_span:4,row_span:2},
											block: {
												params: {question:false,content:"This block isn't numbered, like you might use for a block containing only test directions. The option for this is also in the block's menu."}
											}
										},
										{
											params: {row_span:3,col_span:2,row:16,col:1},
											block: {
												params: {question:true,content:"You can add more blocks or pages using the menu on the left side of the page."}
											}
										},
										{
											params: {row_span:3,col_span:2,row:16,col:3},
											block: {
												params: {question:true,content:"When you're done, get a PDF version with one click on that same menu."}
											}
										},
										{
											params: {row_span:2,col_span:4,row:19,col:1},
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