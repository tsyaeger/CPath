class JobDocument < ApplicationRecord
	belongs_to :job 
	belongs_to :document 
end
