module JobsHelper

	def date_posted(job)
		job.date_posted.strftime("%m/%d/%Y") 
	end

	def truncate_desc(desc)
		truncate_desc(desc, length: 10, omission: '...')
	end

end