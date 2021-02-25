class EntrySerializer < ActiveModel::Serializer
  attributes :id, :agg_score, :agg_score_key
  has_one :user
  has_many :prompts
  has_many :scores, through: :prompts
end
