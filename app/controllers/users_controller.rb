# frozen_string_literal: true

class UsersController < ApplicationController
  PER = 6

  def index; end

  def show
    @user = User.find_by(id: params[:id])
    @blog = Blog.find_by(id: params[:id])
  end

  def list
    @users = User.all.order(created_at: :desc).page(params[:page]).per(PER)
  end
end
