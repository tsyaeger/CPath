class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :email
  has_many :contacts
  has_many :jobs
  has_many :documents
  has_many :tasks
end
