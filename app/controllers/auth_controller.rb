require 'open-uri'

class AuthController < ApplicationController
  def facebook
    app_id = "149705581903855"
    app_secret = "9892ab887a2c08477ac8536c457a45e8"
    redirect_uri = "http://localhost:3000/auth/facebook"
    code = params[:code]

    endpoint_url = "https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&redirect_uri=#{redirect_uri}&client_secret=#{app_secret}&code=#{code}"

    result = open(endpoint_url).read
    parsed_result = Rack::Utils.parse_query(result)

    access_token = parsed_result["access_token"]

    current_user.facebook_access_token = access_token
    current_user.save

    redirect_to user_url(current_user)
  end
end
