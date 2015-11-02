require 'math-to-itex'

class EquationExtractor
  attr_reader :array

  def initialize string,styles
    @string = MathToItex(string).convert { |string| "EQUATION_SPLIT" + string + "EQUATION_SPLIT" }
    @styles = styles
    @array = convert_to_content_objects @string.split "EQUATION_SPLIT"
  end

  def convert_to_content_objects string_array
    converted_array = []
    string_array.each do |string|
      if string[0] == "$" && string[string.length-1] == "$" #is an equation
        converted_array.push Equation.new(string)
        converted_array.push Snippet.new(nil,@styles)
      else
        string.split(" ").each do |word|
          converted_array.push Snippet.new(word,@styles)
          converted_array.push Snippet.new(nil,@styles)
        end
      end
    end

    return converted_array
  end

end