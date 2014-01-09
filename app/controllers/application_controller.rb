class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def initialize_redis
	uri = URI.parse(ENV["REDISCLOUD_URL"])
	$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
  end
end
