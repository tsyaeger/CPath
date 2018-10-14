class Contact < ApplicationRecord
	belongs_to :user
	has_many :job_contacts
	has_many :jobs, through: :job_contacts
	has_many :tasks


	validates_associated :user


	scope :filtered_contact, -> (substring) { where("last_name LIKE ? OR first_name LIKE ?", "%#{substring}%", "%#{substring}%")}

	scope :is_reference, -> { where('reference = ?',true) }


end
