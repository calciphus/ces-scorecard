class MainController < ApplicationController
	# Allow non-CSRF posts to the webhook
	protect_from_forgery :except => [:webhook]

	# Initialize the Redis connection
	before_filter :initialize_redis

	def index
		@leader_names = $redis.zrevrange("site_counts",0,9)
		@scorelist = Hash.new
		@series = []
		@leader_names.each do |leader|
			lscore = $redis.zscore("site_counts", leader)
			@series << lscore
			@scorelist[leader] = lscore
		end

	end

	def about
	end

	def webhook
		
		if params[:token] == ENV['SIMPLE_TOKEN']
			if params[:interactions]
				params[:interactions].each do |iac|
					if i