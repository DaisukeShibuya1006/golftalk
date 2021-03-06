# frozen_string_literal: true

class UsersController < ApplicationController
  PER = 6

  def index
  end

  def show
    @user = User.find_by(id: params[:id])
    @blog = Blog.find_by(id: params[:id])
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def list
    @users = User.order(created_at: :desc).page(params[:page]).per(24)
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end

  def follow_list
    @user = User.find(params[:id])
  end

  def follower_list
    @user = User.find(params[:id])
  end
end
