# frozen_string_literal: true

class HomesController < ApplicationController
  def guest_sign_in
    user = User.find_or_create_by(email: 'test@gmail.com') do |user|
      user.password = testtest
      user.confirmed_at = Time.now
    end
    sign_in user
    redirect_to '/blogs/new', notice: 'ゲストユーザーとしてログインしました。'
  end
end
