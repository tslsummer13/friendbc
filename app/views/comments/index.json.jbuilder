json.array!(@comments) do |comment|
  json.extract! comment, :commenter_name, :commenter_facebook_id, :message, :created_time, :comment_facebook_id, :post_id
  json.url comment_url(comment, format: :json)
end
