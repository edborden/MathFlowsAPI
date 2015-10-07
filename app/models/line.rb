class Line < ActiveRecord::Base
  include ProcessedContent

  belongs_to :lineable, polymorphic: true
  #validates_presence_of :lineable #breaks block.amoeba copy
  has_many :styles, dependent: :destroy

  def has_write_access? user
    lineable.user == user
  end

  amoeba {enable}

end