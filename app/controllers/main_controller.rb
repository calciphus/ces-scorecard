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
					if iac[:links] and iac[:links][:url]
						dom = URI.parse(iac[:links][:url].to_s).host
						$redis.zincrby("site_counts", 1, dom)
					end
				end
			end
		end
		respond_to do |format|
			# Respond with success per Datasift documentation
			format.json{
				render :json => Hash["success" => true].to_json
			}
		end
	end
end