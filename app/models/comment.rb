# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :blog, dependent: :destroy
  validates :body, presence: true
end
