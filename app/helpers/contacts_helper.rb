module ContactsHelper


	def formatted_name(contact)
		return ("#{contact.first_name} #{contact.last_name}").titlecase
	end

end
