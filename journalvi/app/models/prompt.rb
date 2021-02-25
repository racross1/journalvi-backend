class Prompt < ApplicationRecord
  belongs_to :entry
  has_many :scores, dependent: :destroy

  def generate_score
    client = Aws::Comprehend::Client.new(region: 'us-west-2')
    resp = client.detect_sentiment({text: self.response, language_code: "en"})
    Score.create(
      prompt_id: self.id, 
      sentiment: resp.sentiment, 
      pos_score: resp.sentiment_score.positive,
      neg_score: resp.sentiment_score.negative,
      neut_score: resp.sentiment_score.neutral,
      mixed_score: resp.sentiment_score.mixed 
    )
  end
  
end
