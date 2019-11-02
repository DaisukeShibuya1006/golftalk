# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :blog, counter_cache: :likes_count
  belongs_to :user
end
