class EquationExtractor
	attr_reader :array

	def initialize string,styles
		@string = string
		@styles = styles
		@array = convert_to_content_objects @string.split
	end

	def convert_to_content_objects string_array
		converted_array = []
		string_array.each do |string|
			if string[0] == "$" && string[string.length-1] == "$" #is an equation
				converted_array.push Equation.new(string)
				converted_array.push Snippet.new
			else
				converted_array.push Snippet.new(string+" ",@styles)
			end
		end

		return converted_array
	end

end