# == Schema Information
#
# Table name: cars
#
#  id              :integer          not null, primary key
#  car_license     :string
#  description     :text
#  enter_date      :date
#  car_category    :string
#  car_subcategory :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_user


  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.all
    @car_statuses = CarStatus.all
    @users = User.all
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @cars = Car.all
    @car_images = CarImage.all
    @car_statuses = CarStatus.where(car_id: @car.id)
    @users = User.all
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    checkbox = params[:inlineCheckboxhidden].split(",")

    @car = Car.new(car_params)
    @car.user_id = @user.id

    respond_to do |format|
      if @car.save
        checkbox.each do |c|
          @car_status = CarStatus.create(description: c, status: false, car_id: @car.id)
          @car_status.save
        end
        format.html { redirect_to user_car_path(@user,@car), notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: user_car_path(@user,@car).errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @user, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end
    def set_user
      @user = User.find(params[:user_id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:car_license, :description, :enter_date, :car_category, :car_subcategory)
    end
end
