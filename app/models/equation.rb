require 'open-uri'
require 'cgi'

class Equation

  def initialize latex
    @latex = "$#{latex}$" #add $ for display math mode
  end

  def url
    @url ||= "http://mathflows-latex.herokuapp.com/render?math=" + CGI.escape(@latex)
    #@url ||= URI.encode("http://latex.codecogs.com/svg.latex?\\dpi{300}" + @latex)
  end 

  def alignment
    OpenStruct.new side: "left", left?:true
  end

  def write_to_pdf pdf
    pdf.svg file, vposition: :center# scale: 0.25
  end

  def file
    @file ||= open url
  end

  def file_hash
    @hash ||= begin
      read = file.read
      file.rewind
      Hash.from_xml(read)["svg"]
    end
  end

  def width
    @width ||= strip file_hash["width"]
  end

  def height
    @height ||= strip file_hash["height"]
  end

  def strip string
    string.chomp("pt").to_f
  end

end