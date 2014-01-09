class MainController < ApplicationController
	# Allow non-CSRF posts to the webhook
	protect_from_forgery :except => [:webhook]

	# Initialize the Redis connection
	before_filter :initialize_redis

	def index
	end

	def about
	end

	def webhook
		
		if params[:token] == ENV['SIMPLE_TOKEN']
			params[:interactions].each do |iac|
				puts iac[:links][:url]
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