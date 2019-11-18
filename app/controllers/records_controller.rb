class RecordsController < ApplicationController
  def show
    @records = Record.all
    # @record = Record.find(id:params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    Record.create(record_params)
    @record.id = current_user.id
    blogs_path
  end

  def edit
    @record = Record.find(params[:id])
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:when, :course)
  end
end
