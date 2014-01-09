class MainController < ApplicationController
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
  		format.js{
  			render :json => "OK"
  		}
  	end
  end
end
