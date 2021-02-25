require 'aws-sdk-comprehend'
require 'byebug'

def testString(string)
    client = Aws::Comprehend::Client.new(region: 'us-west-2')
    resp = client.detect_sentiment({text: string, language_code: "en"})
    positive = resp.sentiment_score.positive
    negative = resp.sentiment_score.negative
    neutral = resp.sentiment_score.neutral
    mixed = resp.sentiment_score.mixed
    byebug
    puts resp        
end 

testString("I love you!")


puts 'done'


#in the above to access score attributes:
# resp.sentiment
# => "POSITIVE"

# resp.sentiment_score.positive
# => 0.9990289211273193