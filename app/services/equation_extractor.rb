class EquationExtractor

	def initialize string
		@string = string
	end

	def array
		sliced_string = slice_string_at equation_indexes
		converted_string_array = convert_images_in sliced_string
		#clean_string_array = clean_strings_in converted_string_array
	end

	def contains_equations?
		equation_indexes.present?
	end

	def starts_with_equation?
		@string[0] == "$"
	end

	def equation_indexes
		@cached_equation_indexes ||= find_all_d @string
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

	def slice_string_at indexes
		sliced_string = []
		unless starts_with_equation?
			sliced_string << @string[0..indexes[0]-1]
		end
		indexes.each_with_index do |item,index|
			if indexes[index+1]
				slice = @string[item..indexes[index+1]]
				sliced_string << slice
			end
		end
		puts sliced_string
		return sliced_string
	end

	def convert_images_in string_array
		string_array.each_with_index do |string,index|
			if string[0] == "$"
				string.replace string[0..-1]
				string.chop
				string_array[index] = Image.new({latex: string})
			end
		end
		return string_array
	end

	#def clean_strings_in string_array
	#	string_array
	#end

end