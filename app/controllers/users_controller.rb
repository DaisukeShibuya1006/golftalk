# frozen_string_literal: true

class UsersController < ApplicationController
  PER = 6

  def index; end

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
    @users = User.all.order(created_at: :desc).page(params[:page]).per(PER)
  end
end
