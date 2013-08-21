class Post < ActiveRecord::Base

  validates :post_facebook_id, uniqueness: true, presence: true
  validates :user, presence: true
  validates :link, presence: true
  validates :sharer_name, presence: true
  validates :sharer_facebook_id, presence: true
  validates :created_time, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

end
