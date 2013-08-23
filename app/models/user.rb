require 'open-uri'

class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy

  def poll_facebook
    begin
      url = "https://graph.facebook.com/me/home?access_token=#{self.facebook_access_token}&limit=200"
      raw_response = open(url).read
      parsed_response = JSON.parse(raw_response)
      posts = parsed_response['data'].select { |p| p['type'] == 'video' }
    rescue Exception => e
      puts e
      posts = []
    end

    posts.each do |the_post|
      post = Post.new
      post.sharer_name = the_post['from']['name']
      post.sharer_facebook_id = the_post['from']['id']
      post.message = the_post['message']
      post.link = the_post['link']
      post.created_time = the_post['created_time']
      post.post_facebook_id = the_post['id']
      post.user_id = self.id
      unless post.save
        post = Post.find_by(post_facebook_id: the_post['id'])
      end
      if the_post['comments'].present?
        the_post['comments']['data'].each do |the_comment|
          comment = Comment.new
          comment.commenter_name = the_comment['from']['name']
          comment.commenter_facebook_id = the_comment['from']['id']
          comment.message = the_comment['message']
          comment.created_time = the_comment['created_time']
          comment.comment_facebook_id = the_comment['id']
          comment.post_id = post.id
          comment.save
        end
      end
    end
    puts "Successfully polled for #{self.username}"
  end
end
