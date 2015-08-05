class MasterMold

	def fresh_user
		{
			params:nil,
			folders: [intro_test],
			blocks: default_headers
		}
	end

	def default_headers
		[
			{
				params: {
					col:0,
					row:0,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18,
					header:true
				},
				lines: [{content:"Date: _________________________",position:1}]
			},
			{
				params: {
					col:2,
					row:0,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18,
					header:true			
				},
				lines: [{content:"Name: ____________________",position:1}]
			},
			{
				params: {
					col:0,
					row:1,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18,
					header:true		
				},
				lines: [{content:"Chapter 3 Test",position:1}]
			},
			{
				params: {
					col:2,
					row:1,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18,
					header:true		
				},
				lines: [{content:"Ms. Smith",position:1}]
			},
			{
				params: {
					col:0,
					row:2,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18,
					header:true			
				},
				lines: [{content:"Algebra 2",position:1}]
			},
			{
				params: {
					col:2,
					row:2,
					row_span:1,
					col_span:2,
					question: false,
					lines_height:18,
					header:true
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
										row:3,
										col:0,
										question:true,
										lines_height:18
									},
									lines: [{content:"Click on any block to select it. Selected blocks can be resized and dragged around.",position:1}]
								},
								{
									params: {
										row_span:3,
										col_span:2,
										row:3,
										col:2,
										question:true
									},
									lines: [{content:"Edit text by clicking on it. Switch to math mode and insert equations with the '\\$' key. $f\\left(x\\right)=\\sqrt[3]{4}x+12$",position:1}]
								},
								{
									params: {
										col:0,
										row:6,
										col_span:2,
										row_span:7,
										question:true,
										lines_height:36
									},
									lines: [{content:"Access any selected block's menu on the right, which will allow you to add images...",position:1}],
									image: {params:{height:353,width:446,cloudinary_id:"block_images/v7bz2rx9bs65ecbhyf0n",scale:5}}
								},
								{
									params: {
										col:2,
										row:6,
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
										col:0,
										row:13,
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
										row:15,
										col:0,
										question:true,
										lines_height:36
									},
									lines: [{content:"You can add more blocks or pages using the menu on the left side of the page.",position:1}]
								},
								{
									params: {
										row_span:3,
										col_span:2,
										row:15,
										col:2,
										question:true,
										lines_height:36
									},
									lines: [{content:"When you're done, get a PDF version with one click on that same menu.",position:1}]
								},
								{
									params: {
										row_span:2,
										col_span:4,
										row:18,
										col:0,
										question:true,
										lines_height:36
									},
									lines: [{content:"And once you login, you'll be able to copy tests with one click to easily make multiple versions. Check it out!",position:1}]
								}
							]
						}
					]
				}
			]
		}
	end

end