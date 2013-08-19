json.array!(@posts) do |post|
  json.extract! post, :sharer_name, :sharer_facebook_id, :message, :link, :created_time, :post_facebook_id, :user_id
  json.url post_url(post, format: :json)
end
