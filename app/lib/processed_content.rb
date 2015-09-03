module ProcessedContent

	def processed_content
		if content.blank?
			[Snippet.new]
		else
			EquationExtractor.new(content).array
		end
	end

end