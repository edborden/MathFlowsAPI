class Invalidation < ActiveRecord::Base
	belongs_to :block
	validates_presence_of :block_id,:message
	enum message: [:content,:position]
end