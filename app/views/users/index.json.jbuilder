json.array!(@users) do |user|
  json.extract! user, :username, :password_digest, :first_name, :last_name, :facebook_access_token, :facebook_id
  json.url user_url(user, format: :json)
end
