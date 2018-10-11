class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :completed
  belongs_to :user
  belongs_to :job
  belongs_to :contact
  belongs_to :document
end
