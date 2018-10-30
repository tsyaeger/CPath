class JobSerializer < ActiveModel::Serializer
  attributes :id, :company, :position, :url, :date_posted, :job_desc, :co_desc, :applied
  belongs_to :user
  
  has_many :job_documents  #REMOVE
  has_many :documents

  has_many :job_contacts #REMOVE
  has_many :contacts

  has_many :tasks
end
