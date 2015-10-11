class Style < ActiveRecord::Base

  belongs_to :line
  validates_presence_of :effect
  enum effect: [:bold,:italic,:underline,:red]

  def has_write_access? user
    line.lineable.user == user
  end

  def open_tag
    case effect
    when "bold"
      "<b>"
    when "italic"
      "<i>"
    when "underline"
      "<u>"
    when "red"
      "<color rgb='#FF0000'>"
    end
  end

  def close_tag
    case effect
    when "bold"
      "</b>"
    when "italic"
      "</i>"
    when "underline"
      "</u>"
    when "red"
      "</color>"
    end   
  end

end