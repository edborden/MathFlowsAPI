class EquationExtractor
	attr_reader :array

	def initialize string
		@string = string
		@array = convert_to_content_objects @string.split
	end

	def contains_equations? #not currently used
		@array.any? { |obj| obj.is_a? Image }
	end

	def convert_to_content_objects string_array
		string_array.each_with_index do |string,index|
			if string[0] == "$" && string[string.length-1] == "$" #is an equation
				string_array[index] = Image.new.latex(string)
			else string.is_a? String
				string_array[index] = Snippet.new(string+" ")
			end
		end

		# add trailing space to images
		string_array.each_with_index do |obj,index|
			if obj.is_a? Image
				string_array.insert index+1,Snippet.new
			end
		end

		return string_array
	end

end