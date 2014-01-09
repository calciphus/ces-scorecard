class MainController < ApplicationController
  protect_from_forgery :except => [:webhook]
  before_filter :initialize_redis

  def index
  end

  def about
  end

  def webhook
  	puts params.to_yaml
  	if params[:token] == ENV['SIMPLE_TOKEN']
  		puts "Success"
  	end
  	respond_to do |format|
  		format.json{
  			render :json => "OK".to_json
  		}
  	end
  end
end
