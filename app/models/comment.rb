class Comment < ActiveRecord::Base

  validates :comment_facebook_id, uniqueness: true, presence: true
  validates :post, presence: true
  validates :commenter_name, presence: true
  validates :commenter_facebook_id, presence: true
  validates :created_time, presence: true

  belongs_to :post

end
