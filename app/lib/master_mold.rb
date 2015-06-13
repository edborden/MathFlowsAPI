class MasterMold

	def fresh_user
		{
			params:nil,
			folders: [intro_test],
			blocks: default_headers
		}
	end

	def fresh_folder
		{
			params: {name:"New Folder"},
			tests: [fresh_test]
		}		
	end

	def fresh_test
		{
			params: {name:"New Test"},
			pages: [fresh_page]
		}
	end

	def fresh_page
		{
			params: nil,
			blocks: []
		}
	end

	def default_headers
		[
			{
				params: {
					col:1,
					row:1,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18
				},
				lines: [{content:"Date: _________________________",position:1}]
			},
			{
				params: {
					col:3,
					row:1,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18					
				},
				lines: [{content:"Name: ____________________",position:1}]
			},
			{
				params: {
					col:1,
					row:2,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18				
				},
				lines: [{content:"Chapter 3 Test",position:1}]
			},
			{
				params: {
					col:3,
					row:2,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18				
				},
				lines: [{content:"Ms. Smith",position:1}]
			},
			{
				params: {
					col:1,
					row:3,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18					
				},
				lines: [{content:"Algebra 2",position:1}]
			},
			{
				params: {
					col:3,
					row:3,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18					
				},
				lines: [{content:"Period 5",position:1}]
			}
		]
	end

	def intro_test
		{
			params: {name:"My First Folder",test_folder:true,open:true},
			tests: [
				{
					params: {name:"Intro Test"},
					pages: [
						{
							params: nil,
							blocks: default_headers + [
								{
									params: {
										row_span:3,
										col_span:2,
										row:4,
										col:1,
										question:true,
										lines_height:18
									},
									lines: [{content:"Drag around and resize any block.",position:1}]
								},
								{
									params: {
										row_span:3,
										col_span:2,
										row:4,
										col:3,
										question:true
									},
									lines: [{content:"Edit text by clicking on it. Switch to math mode and insert equations with the '\\$' key. $f\\left(x\\right)=\\sqrt[3]{4}x+12$",position:1}]
								},
								{
									params: {
										col:1,
										row:7,
										col_span:2,
										row_span:7,
										question:true,
										lines_height:36
									},
									lines: [{content:"Double click on any block to access its menu, which will allow you to add images...",position:1}],
									image: {params:{height:353,width:446,cloudinary_id:"block_images/v7bz2rx9bs65ecbhyf0n",scale:5}}
								},
								{
									params: {
										col:3,
										row:7,
										col_span:2,
										row_span:7,
										question:true,
										lines_height:18
									},
									lines: [{content:"...or create graphs.",position:1}],
									image: {params: {width:501,height:398,cloudinary_id:"block_images/eyjdrh6xrt2no9a2ezam",scale:5}}
								},
								{
									params: {
										col:1,
										row:14,
										col_span:4,
										row_span:2,
										question:false,
										lines_height:36
									},
									lines: [{content:"This block isn't numbered, like you might use for a block containing only test directions. The option for this is also in the block's menu.",position:1}]
								},
								{
									params: {
										row_span:3,
										col_span:2,
										row:16,
										col:1,
										question:true,
										lines_height:36
									},
									lines: [{content:"You can add more blocks or pages using the menu on the left side of the page.",position:1}]
								},
								{
									params: {
										row_span:3,
										col_span:2,
										row:16,
										col:3,
										question:true,
										lines_height:36
									},
									lines: [{content:"When you're done, get a PDF version with one click on that same menu.",position:1}]
								},
								{
									params: {
										row_span:2,
										col_span:4,
										row:19,
										col:1,
										question:true,
										lines_height:36
									},
									lines: [{content:"And once you login, you'll be able to make multiple versions of a test, with questions synchronized across versions. Check it out!",position:1}]
								}
							]
						}
					]
				}
			]
		}
	end

end