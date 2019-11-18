# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :authenticate_user!

  PER = 5

  def index
    @blogs = Blog.all.order(created_at: :desc).page(params[:page]).per(PER)
    @users = User.all
    @user = User.find_by(params[:id])
  end

  def show
    @blog = Blog.find_by(id: params[:id])
    @user = User.find_by(id: @blog.uid)
    @like = Like.new
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.uid = current_user.id

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: '投稿が完了しました。' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: '編集内容が反映されました。' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: '投稿を削除しました。' }
      format.json { head :no_content }
    end
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end
end
