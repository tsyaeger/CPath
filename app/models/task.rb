class Task < ApplicationRecord
	belongs_to :user
	belongs_to :contact, optional: true
	belongs_to :job, optional: true
	belongs_to :document, optional: true

	scope :filtered_task, -> (substring) { where("title LIKE ? ", "%#{substring}%")}

end
