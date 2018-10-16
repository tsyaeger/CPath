module DocumentsHelper


	def groupDoctype(documents) 
		return documents.group_by(&:doctype)
	end

end
