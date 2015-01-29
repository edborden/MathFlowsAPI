module AddHeader

	def AddHeader::to_this page
		user = page.document.flow.folder.user
		clone = user.header.amoeba_dup
		clone.save
		position = AddHeader::add_position_to(clone)
		page.child_positions<<position
		return clone
	end

	def AddHeader::add_position_to header
		position = BlockPosition.create MasterMold.new.header_position[:params]
		header.positions<<position
		return position
	end

end