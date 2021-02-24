class PromptSerializer < ActiveModel::Serializer
  attributes :id, :prompt, :response
  has_one :entry
  has_many :scores
end
