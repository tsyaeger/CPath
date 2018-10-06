class Contact < ApplicationRecord
	belongs_to :user
	has_many :job_contacts
	has_many :jobs, through: :job_contacts
	has_many :tasks


	scope :filtered_contact, -> (substring) { where("last_name LIKE ? ", "%#{substring}%")}



end
