require 'uri'
require 'net/http'
require 'json'


class SummaryController < ApplicationController


 def show
   render json: fetch_user
   return
 end


 def fetch_user
   uri = URI("http://user-service:8000/users/#{params[:user_id]}")
   res = Net::HTTP.get_response(uri)
   JSON.parse(res.body)
 end
end
