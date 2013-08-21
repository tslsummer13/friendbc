require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.

# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#

# Examples:

#

#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])

#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.all

users.each do |user|

  begin

  url = "https://graph.facebook.com/me/home?access_token=#{user.facebook_access_token}&limit=200"

  raw_response = open(url).read

  parsed_response = JSON.parse(raw_response)

  posts = parsed_response['data'].select { |p| p['type'] == 'video' }

  rescue



  end

  posts.each do |the_post|

    post = Post.new

    post.sharer_name = the_post['from']['name']

    post.sharer_facebook_id = the_post['from']['id']

    post.message = the_post['message']

    post.link = the_post['link']

    post.created_time = the_post['created_time']

    post.post_facebook_id = the_post['id']

    post.user_id = user.id

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

end
