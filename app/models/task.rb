class Task < ApplicationRecord
	belongs_to :user
	belongs_to :contact, optional: true
	belongs_to :job, optional: true
	belongs_to :document, optional: true
end
