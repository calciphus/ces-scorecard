uri = URI.parse(URI.encode(ENV["REDISCLOUD_URL"]))
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)