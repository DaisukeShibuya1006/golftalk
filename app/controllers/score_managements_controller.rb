class ScoreManagementsController < ApplicationController
  before_action :set_score_management, only: [:show, :edit, :update, :destroy, :myscore]

  # GET /score_managements
  # GET /score_managements.json
  def index
    @score_managements = ScoreManagement.all
    @user = User.find_by(params[:id])
    # @user = User.find_by(id: @score_management.uid)
  end

  # GET /score_managements/1
  # GET /score_managements/1.json
  def show
    @score_management = ScoreManagement.find(params[:id]).order(created_at: :desc)
  end

  def myscore
    @score_management = ScoreManagement.find_by(id: params[:id])
  end

  # GET /score_managements/new
  def new
    @score_management = ScoreManagement.new
  end

  # GET /score_managements/1/edit
  def edit
    @score_management = ScoreManagement.find_by(id: params[:id])
  end

  # POST /score_managements
  # POST /score_managements.json
  def create
    @score_management = ScoreManagement.new(score_management_params)
    @score_management.uid = current_user.id
    respond_to do |format|
      if @score_management.save
        format.html { redirect_to user_path(current_user), notice: 'スコアを入力できました！' }
        format.json { render :show, status: :created, location: @score_management }
      else
        format.html { render :new }
        format.json { render json: @score_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /score_managements/1
  # PATCH/PUT /score_managements/1.json
  def update
    @score_management = ScoreManagement.find_by(id:params[:id])
    respond_to do |format|
      if @score_management.update(score_management_params)
        format.html { redirect_to @score_management, notice: 'Score management was successfully updated.' }
        format.json { render :show, status: :ok, location: @score_management }
      else
        format.html { render :edit }
        format.json { render json: @score_management.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /score_managements/1
  # DELETE /score_managements/1.json
  def destroy
    @score_management = ScoreManagement.find(params[:id])
    @score_management.destroy
    respond_to do |format|
      format.html { redirect_to score_managements_url, notice: 'Score management was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score_management
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_management_params
      params.require(:score_management).permit(:date, :course, :stroke,:uid)
    end
end
