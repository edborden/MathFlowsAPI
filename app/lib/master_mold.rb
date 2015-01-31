class MasterMold

	def fresh_user
		{
			params:nil,
			folders: [intro_test],
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
					snippet_position_question_number,
					{
						params: {row_span:1,col_span:11,col:3,row:1},
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

	def snippet_position_question_number
		{
			params: {row_span:1,col_span:2,row:1,col:1},
			snippet: {
				params: {question_number:true}
			}
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
									block_positions: [
										{
											params: {row_span:2,col_span:2,row:4,col:1},
											block: {
												params: {question:true},
												snippet_positions: [								
													snippet_position_question_number,
													{
														params: {row_span:1,col_span:14,col:3,row:1},
														snippet: {
															params: {question_number:false,content:"Drag around and resize any block."}
														}
													}
												]
											}
										},
										{
											params: {row_span:2,col_span:2,row:4,col:3},
											block: {
												params: {question:true},
												snippet_positions: [								
													snippet_position_question_number,
													{
														params: {row_span:1,col_span:14,col:3,row:1},
														snippet: {
															params: {question_number:false,content:"Double click any block to edit it."}
														}
													}
												]
											}
										},
										{
											params: {col:1,row:6,col_span:2,row_span:7},
											block: {
												params: {question:true},
												snippet_positions: [								
													snippet_position_question_number,
													{
														params: {row_span:3,col_span:10,col:2,row:1},
														snippet: {
															params: {question_number:false,content:"You can add equations..."}
														}
													},
													{
														params: {row_span:3,col_span:10,col:3,row:4},
														snippet: {
															params: {question_number:false,has_equation:true},
															equation: {
																params: nil,													
																image: {
																	params: {
																		data: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAKkAAAAlBAMAAADLidS/AAAAMFBMVEX///8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAv3aB7AAAAD3RSTlMAEJl2u1Tdic1EZu8yqyJi4sUJAAACmElEQVRIDe1UPWgUURCed3eby+6dd4cIFoI5QQsL4YiFWAgHwUIbD6OIh8VZChZBUBAUYxUQhAOJkAvISsDYSNLYiOASsJWA4E9xspUWgp6Fpa4z897b2327uLokXR68NzPfN+9jdnZ2ATLWHi8jIQ/9Za2f51rWnfqO6k4HdAes2WZiXh5cS0D/BoSTVYfT5g3hFuZMLBYLl0MnBlIQqtZgxiTtnjNvYrG40OBQNGMowN4zC56CxF2DA/DLmwlMA7unAY6roKvBpD3XSWITfgyjn8bKwT5jJ88CzCt2Utk085bBqh/hPkpfYfTTcBq1nwSKHwCWiw6tossm5XgKTxh1ZCnsFz0/huFLmPDgHWFWD6Dkk4er2maTcgzgNqNR1fP7WzEMVSsu3EFM3FhAH53uze4ngHVOMw6inGMHGFWq1uris29BMBfF1MBwrSUXSNX2v3ZeAowMQQoVJRml+qj2vOJJBEDXz2MouK9EfsZGwDIlXcZdGNKSZRCmKHJDhY4deaqYaqlFaVO4URVk30h1vOoBLgxlS9E5Mvxwf/ieEsajOsa41qPEwkPc+8i5R0ekAgrVYkr6uq5JV5Nh/dxXi0uFE8jS2xK/oS9VzQ4oSqpo1SnfDmU1RrUOoEg4DTdO1rIzwmFOnSxJKQ2pYK+vwRuFxGqtHl7CjwrgCm7HhY1LFy7iV9AJU8eOpFQsVauHXl/HwmIY/zQqQfCL0BFu0SYP19++WJlhedJGzwQm7Dbxt1TSQFltnOlT2v0fW1nlBynIO6Jp3H0M39N6YmQlwvIKQ/qv3TASrsKungFtQfgCytT3LV/bUSt+0Hn6mvlsM5kZORKKrRyXMq/MZmbkSLBd2IZiN5YWmzmKybjyKgg2M1JS6D9DP6Hhkil9egAAAABJRU5ErkJggg=="
																	}
																}
															}
														}
													}
												]
											}
										},
										{
											params: {col:3,row:6,col_span:2,row_span:7},
											block: {
												params: {question:true},
												snippet_positions: [								
													snippet_position_question_number,
													{
														params: {row_span:1,col_span:10,col:2,row:1},
														snippet: {
															params: {question_number:false,content:"...and images."}
														}
													},
													{
														params: {row_span:5,col_span:10,col:3,row:2},
														snippet: {
															params: {question_number:false,has_image:true},													
															image: {
																params: {
																	data: "data:image/jpeg;base64,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"
																}
															}
														}
													}
												]
											}
										},
										{
											params: {col:1,row:10,col_span:4,row_span:2},
											block: {
												params: {question:false},
												snippet_positions: [								
													{
														params: {row_span:1,col_span:15,col:2,row:1},
														snippet: {
															params: {question_number:false,content:"This is a directions block with no number. You can add it on the left menu of this page."}
														}
													}
												]
											}
										},
										{
											params: {row_span:3,col_span:2,row:12,col:1},
											block: {
												params: {question:true},
												snippet_positions: [								
													snippet_position_question_number,
													{
														params: {row_span:3,col_span:14,col:3,row:1},
														snippet: {
															params: {question_number:false,content:"Question blocks are automatically numbered for you, even across pages (you can also add pages on the left menu)."}
														}
													}
												]
											}
										},
										{
											params: {row_span:3,col_span:2,row:12,col:3},
											block: {
												params: {question:true},
												snippet_positions: [								
													snippet_position_question_number,
													{
														params: {row_span:3,col_span:14,col:3,row:1},
														snippet: {
															params: {question_number:false,content:"When you're done, get a pixel perfect PDF version with one click on the left."}
														}
													}
												]
											}
										},
										{
											params: {row_span:2,col_span:4,row:15,col:1},
											block: {
												params: {question:true},
												snippet_positions: [								
													snippet_position_question_number,
													{
														params: {row_span:2,col_span:14,col:3,row:1},
														snippet: {
															params: {question_number:false,content:"And once you login, you'll be able to make multiple versions of a test, with questions synchronized across versions. Check it out!"}
														}
													}
												]
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