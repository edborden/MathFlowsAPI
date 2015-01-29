class MasterMold

	def fresh_user
		{
			params:nil,
			folders: [fresh_folder],
			header_block: header_block
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
			block_positions: [block_position_question],
		}
	end

	def block_position_question position_params=nil
		unless position_params
			position_params = {row_span:3,col_span:2}
		end
		{
			params: position_params,
			block: {
				params: {question:true},
				snippet_positions: [								
					{
						params: {row_span:1,col_span:3,row:1,col:1},
						snippet: {
							params: {question_number:true}
						}
					},
					{
						params: {row_span:1,col_span:10,col:4,row:1},
						snippet: {
							params: {question_number:false,content:"[Add question here.]"}
						}
					}
				]
			}			
		}
	end

	def block_position_directions position_params=nil
		unless position_params
			position_params = {row_span:2,col_span:4}
		end
		{
			params: position_params,
			block: {
				params: {question:false},
				snippet_positions: [								
					{
						params: {row_span:1,col_span:15,row:1,col:2},
						snippet: {
							params: {question_number:false,content:"[Add directions here.]"}
						}
					}
				]
			}			
		}
	end

	def header_position
		{
			params: {col:1,row:1,col_span:4,row_span:3}
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
						params: {content:"Name: ________________________________"}
					}
				},
				{
					params: {col:1,row:2,row_span:1,col_span:8},
					snippet: {
						params: {content:"Chapter 3 Test"}
					}
				},
				{
					params: {col:9,row:2,row_span:1,col_span:8},
					snippet: {
						params: {content:"Ms. Smith"}
					}
				},
				{
					params: {col:1,row:3,row_span:1,col_span:8},
					snippet: {
						params: {content:"Algebra 2"}
					}
				}
			]
		}
	end

end