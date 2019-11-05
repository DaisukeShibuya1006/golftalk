# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  validates :name, presence: true
  mount_uploader :image, ImageUploader

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(
      uid: auth.uid,
      provider: auth.provider,
      email: auth.info.email,
      name: auth.info.name,
      password: Devise.friendly_token[0, 20],
      image: auth.info.image
    )
    user
 end

  has_many :blogs
  has_many :messages
  has_many :entries

  has_many :likes, dependent: :destroy
  has_many :liked_blogs, through: :likes, source: :blog

  def already_liked?(blog)
    self.likes.exists?(blog_id: blog.id)
  end

  def blogs
    Blog.where(uid: id)
  end
end
