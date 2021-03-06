BEGIN{
	CONSUMER_KEY = ENV["consumer_key"]
	CONSUMER_SECRET = ENV["consumer_secret"]
	OAUTH_TOKEN = ENV["oauth_token"]
	OAUTH_TOKEN_SECRET = ENV["oauth_token_secret"]
}

require 'twitter'

Twitter.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.oauth_token = OAUTH_TOKEN
  config.oauth_token_secret = OAUTH_TOKEN_SECRET
end 

blocked_user = Twitter.blocking

blocked_user.each do |user|
	Twitter.unblock(user[:id])
end
