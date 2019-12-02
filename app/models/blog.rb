# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy

  def user
    User.find_by(id: uid)
  end
end
