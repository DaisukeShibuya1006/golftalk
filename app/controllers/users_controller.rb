class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def list
    @users = User.all
  end

end
