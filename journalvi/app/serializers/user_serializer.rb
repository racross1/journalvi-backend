class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :entries
  has_many :prompts, through: :entries 

  # def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
  #   hash = super
  #   hash.each { |key, value| hash.delete(key) if value.nil? }
  #   hash
  # end
end
