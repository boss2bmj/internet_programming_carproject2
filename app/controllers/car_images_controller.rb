class CarImagesController < ApplicationController
  before_action :set_car_image, only: [:show, :edit, :update, :destroy]
  before_action :set_car_status
  before_action :set_car
  # GET /car_images
  # GET /car_images.json
  def index
    @car_images = CarImage.all
  end

  # GET /car_images/1
  # GET /car_images/1.json
  def show
  end

  # GET /car_images/new
  def new
    @car_image = CarImage.new
  end

  # GET /car_images/1/edit
  def edit
  end

  # POST /car_images





  # POST /car_images.json
  def create
    @car_image = CarImage.new(car_image_params)
    @car_image.car_status_id = @car_status.id
    if @car_image.save
        redirect_to car_car_status_path(@car,@car_status), notice: 'Car was successfully created.'

      else
        render 'new'

      end
    end

  # PATCH/PUT /car_images/1
  # PATCH/PUT /car_images/1.json
  def update
    respond_to do |format|
      if @car_image.update(car_image_params)
        format.html { redirect_to car_car_status_path(@car,@car_status), notice: 'Car image was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_image }
      else
        format.html { render :edit }
        format.json { render json: @car_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_images/1
  # DELETE /car_images/1.json
  def destroy
    @car_image.destroy
    respond_to do |format|
      format.html { redirect_to car_car_status_path(@car,@car_status), notice: 'Car image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_image
      @car_image = CarImage.find(params[:id])
    end
    def set_car_status
      @car_status = CarStatus.find(params[:car_status_id])

    end
    def set_car
      @car = Car.find(params[:car_id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_image_params
      params.require(:car_image).permit(:image_name, :image)
    end
end
