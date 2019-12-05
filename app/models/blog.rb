# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :content, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments

  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  def user
    User.find_by(id: uid)
  end
end
