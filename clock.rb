# encoding: UTF-8

BEGIN{
	CONSUMER_KEY = ENV["consumer_key"]
	CONSUMER_SECRET = ENV["consumer_secret"]
	OAUTH_TOKEN = ENV["oauth_token"]
	OAUTH_TOKEN_SECRET = ENV["oauth_token_secret"]
}

require 'clockwork'
require 'twitter'
include Clockwork

Twitter.configure do |config|
	config.consumer_key = CONSUMER_KEY
	config.consumer_secret = CONSUMER_SECRET
	config.oauth_token = OAUTH_TOKEN
	config.oauth_token_secret = OAUTH_TOKEN_SECRET
end

handler do |job|

	blocked_user = Twitter.blocking

	blocked_user.each do |user|
		Twitter.unblock(user[:id])
		puts "unblocked: #{user[:screen_name]}"
	end
end

every(10.seconds,'twitter_unblock.job')
