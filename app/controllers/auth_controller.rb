require 'open-uri'

class AuthController < ApplicationController
  def twitter
    logger.debug request.env['omniauth.auth'].to_yaml

    redirect_to user_url(current_user)
  end

  def facebook
    app_id = ENV["FRIENDBC_FACEBOOK_APP_ID"]
    app_secret = ENV["FRIENDBC_FACEBOOK_APP_SECRET"]
    redirect_uri = facebook_callback_url
    code = params[:code]

    endpoint_url = "https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&redirect_uri=#{redirect_uri}&client_secret=#{app_secret}&code=#{code}"

    result = open(endpoint_url).read
    parsed_result = Rack::Utils.parse_query(result)

    access_token = parsed_result["access_token"]

    current_user.facebook_access_token = access_token
    current_user.save

    current_user.poll_facebook

    redirect_to user_url(current_user)
  end
end
