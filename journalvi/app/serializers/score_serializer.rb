class ScoreSerializer < ActiveModel::Serializer
  attributes :id, :sentiment, :pos_score, :neg_score, :neut_score, :mixed_score
  has_one :prompt
end
