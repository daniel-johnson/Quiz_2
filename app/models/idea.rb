class Idea < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  
  belongs_to :user
  has_many :comments

  has_many :members, dependent: :destroy
  has_many :member_users, through: :member, source: :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true
  validates :description, presence: true
end
