class Job < ApplicationRecord

	belongs_to :user
	has_many :job_contacts
	has_many :contacts, through: :job_contacts
	has_many :job_documents
	has_many :documents, through: :job_documents
	has_many :tasks



	scope :filtered_job, -> (substring) { where("company LIKE ? OR position LIKE ?", "%#{substring}%", "%#{substring}%") }

	# scope :applied, -> { where("applied = ? ", true) }


	def next
		join_query = "LEFT OUTER JOIN users ON user_id = users.id"
		where_query = "jobs.id > ? AND jobs.user_id = ?"

		job = Job.joins(join_query).where(where_query, self.id, self.user_id).first 
		return job ||= Job.find_by(:user_id => self.user_id)
	end


	def previous
		join_query = "LEFT OUTER JOIN users ON user_id = users.id"
		where_query = "jobs.id > ? AND jobs.user_id = ?"

		job = Job.joins(join_query).where(where_query, self.id, self.user_id).first 
		return job ||= Job.find_by(:user_id => self.user_id) 
	end


end
