# == Schema Information
#
# Table name: car_statuses
#
#  id          :integer          not null, primary key
#  description :text
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  car_id      :integer
#

class CarStatusesController < ApplicationController
  before_action :set_car_status, only: [:show, :edit, :update, :destroy]
  before_action :set_car
  before_action :set_user

  # GET /car_statuses
  # GET /car_statuses.json
  def index
    @car_statuses = CarStatus.all
    @car_images = CarImage.all
    @users = User.all
  end

  # GET /car_statuses/1
  # GET /car_statuses/1.json
  def show
    @car_images = CarImage.where(car_status_id: @car_status.id)
  end

  # GET /car_statuses/new
  def new
    @car_status = CarStatus.new
  end

  # GET /car_statuses/1/edit
  def edit
  end

  # POST /car_statuses
  # POST /car_statuses.json
  def create
    @car_status = CarStatus.new(car_status_params)
    @car_status.car_id = @car.id
    if @car_status.save
        redirect_to user_car_path(@user,@car), notice: 'Car was successfully created.'
      else
        render 'new'

      end
    end


  # PATCH/PUT /car_statuses/1
  # PATCH/PUT /car_statuses/1.json
  def update
    respond_to do |format|
      if @car_status.update(car_status_params)
        format.html { redirect_to user_car_path(@user,@car), notice: 'Car status was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: user_car_path(@user,@car).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_statuses/1
  # DELETE /car_statuses/1.json
  def destroy
    @car_status.destroy
    respond_to do |format|
      format.html { redirect_to user_car_path(@user,@car,@car_status), notice: 'Car Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_status
      @car_status = CarStatus.find(params[:id])
    end

    def set_car
      @car = Car.find(params[:car_id])

    end

    def set_user
      @user = User.find(params[:user_id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_status_params
      params.require(:car_status).permit(:description, :status)
    end
end
