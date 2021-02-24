require 'aws-sdk-comprehend'

def testString(string)
    client = Aws::Comprehend::Client.new(region: 'us-west-2')
    resp = client.detect_sentiment({text: string, language_code: "en"})
    puts resp        
end 

testString("I love you!")