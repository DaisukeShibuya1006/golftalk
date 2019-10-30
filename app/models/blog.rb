# frozen_string_literal: true

class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader

  belongs_to :user

  def user
    User.find_by(id: uid)
  end
end
