class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :entries
  has_many :prompts, through: :entries 
end
