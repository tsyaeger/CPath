class Session < ApplicationRecord
	validates :username, :password_digest, presence: true 
end
