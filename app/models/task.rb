class Task < ApplicationRecord
	belongs_to :user
	belongs_to :contact, optional: true
	belongs_to :job, optional: true
	belongs_to :document, optional: true

	validates_associated :user
	
	scope :filtered_task, -> (substring) { where("title LIKE ? ", "%#{substring}%")}
	
	scope :completed_false, -> { where('completed = ?',false) }
	scope :completed_true, -> { where('completed = ?',true) }

	scope :overdue, -> { where('due_date < ?', DateTime.now.end_of_day) }
	scope :upcoming, -> { where('due_date >= ?', DateTime.now.beginning_of_day) }
	scope :today, -> { where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
end
