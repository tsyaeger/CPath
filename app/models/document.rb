class Document < ApplicationRecord
	belongs_to :user
	has_many :tasks
	has_many :job_documents
	has_many :jobs, through: :job_documents

	scope :filtered_document, -> (substring) { where("title LIKE ? ", "%#{substring}%")}


	def self.groupDoctype 
		return self.all.group_by(&:doctype)
	end




end
