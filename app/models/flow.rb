class Flow < ActiveRecord::Base
	has_many :documents, dependent: :destroy
	belongs_to :folder
end
