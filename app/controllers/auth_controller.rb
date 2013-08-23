class AuthController < ApplicationController
  def facebook
    app_id = "149705581903855"
    app_secret = "9892ab887a2c08477ac8536c457a45e8"
    redirect_uri = "http://localhost:3000/auth/facebook"

    # Write code here to exchange the code and our app secret for the access token
    # Save the access token to the appropriate User row
    # Redirect back to the user's show page
    # https://developers.facebook.com/docs/facebook-login/login-flow-for-web-no-jssdk/#confirm
  end
end
