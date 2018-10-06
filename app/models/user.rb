class User < ApplicationRecord
	has_many :contacts
	has_many :documents
	has_many :jobs
	has_many :tasks
end
