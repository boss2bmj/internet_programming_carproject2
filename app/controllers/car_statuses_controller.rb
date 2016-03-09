class CarStatusesController < ApplicationController
  before_action :set_car_status, only: [:show, :edit, :update, :destroy]

  # GET /car_statuses
  # GET /car_statuses.json
  def index
    @car_statuses = CarStatus.all
  end

  # GET /car_statuses/1
  # GET /car_statuses/1.json
  def show
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

    respond_to do |format|
      if @car_status.save
        format.html { redirect_to @car_status, notice: 'Car status was successfully created.' }
        format.json { render :show, status: :created, location: @car_status }
      else
        format.html { render :new }
        format.json { render json: @car_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_statuses/1
  # PATCH/PUT /car_statuses/1.json
  def update
    respond_to do |format|
      if @car_status.update(car_status_params)
        format.html { redirect_to @car_status, notice: 'Car status was successfully updated.' }
        format.json { render :show, status: :ok, location: @car_status }
      else
        format.html { render :edit }
        format.json { render json: @car_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_statuses/1
  # DELETE /car_statuses/1.json
  def destroy
    @car_status.destroy
    respond_to do |format|
      format.html { redirect_to car_statuses_url, notice: 'Car status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_status
      @car_status = CarStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_status_params
      params.require(:car_status).permit(:description, :status)
    end
end
