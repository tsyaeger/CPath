class ContactSerializer < ActiveModel::Serializer
	attributes :id, :first_name, :last_name, :workplace, :linkedin, :phone, :email, :reference
	belongs_to :user

	has_many :job_contacts
	has_many :jobs

	has_many :tasks
end
