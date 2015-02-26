class EquationExtractor

	def initialize string
		@string = string
	end

	def array
		convert_to_content_objects @string.split
		#clean_string_array = clean_strings_in converted_string_array
		#converted_string_array = convert_strings_in converted_string_array
	end

	def contains_equations?
		equation_indexes.present?
	end

	def equation_indexes
		@cached_equation_indexes ||= find_all_d(@string)
	end

	def find_all_d string
		indexes = []
		index = -1
		while index = string.index('$',index + 1)
			indexes << index
		end
		return remove_intentional indexes
	end

	def remove_intentional ar
		ar.delete_if { |index| @string[index-1] == "\\"}
	end

	def convert_to_content_objects string_array
		string_array.each_with_index do |string,index|
			if string[0] == "$" && string[string.length-1] == "$" #is an equation
				string_array[index] = Image.new({latex: string})
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