class DerivativesController < ApplicationController
  before_action :set_derivative, only: [:show, :edit, :update, :destroy]
  before_action :set_model
  before_action :set_model_range
  before_action :set_manufacturer
  before_action :set_channel

  # GET /derivatives
  # GET /derivatives.json
  def index
    @derivatives = Derivative.all
  end

  # GET /derivatives/1
  # GET /derivatives/1.json
  def show
  end

  # GET /derivatives/new
  def new
    @derivative = Derivative.new
  end

  # GET /derivatives/1/edit
  def edit
  end

  # POST /derivatives
  # POST /derivatives.json
  def create
    @derivative = Derivative.new(derivative_params)

    respond_to do |format|
      if @derivative.save
        format.html { redirect_to @derivative, notice: 'Derivative was successfully created.' }
        format.json { render :show, status: :created, location: @derivative }
      else
        format.html { render :new }
        format.json { render json: @derivative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /derivatives/1
  # PATCH/PUT /derivatives/1.json
  def update
    respond_to do |format|
      if @derivative.update(derivative_params)
        format.html { redirect_to @derivative, notice: 'Derivative was successfully updated.' }
        format.json { render :show, status: :ok, location: @derivative }
      else
        format.html { render :edit }
        format.json { render json: @derivative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /derivatives/1
  # DELETE /derivatives/1.json
  def destroy
    @derivative.destroy
    respond_to do |format|
      format.html { redirect_to derivatives_url, notice: 'Derivative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_derivative
    @derivative = Derivative.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'shared/404', status: :not_found
  end

  def set_model
    @model = Model.friendly.find(params[:model_id])
  rescue ActiveRecord::RecordNotFound
    render 'shared/404', status: :not_found
  end

  def set_model_range
    @model_range = ModelRange.friendly.find(params[:model_range_id])
  rescue ActiveRecord::RecordNotFound
    render 'shared/404', status: :not_found
  end

  def set_manufacturer
    @manufacturer = Manufacturer.friendly.find(params[:manufacturer_id])
  rescue ActiveRecord::RecordNotFound
    render 'shared/404', status: :not_found
  end

  def set_channel
    @channel = Channel.friendly.find(params[:channel_id])
  rescue ActiveRecord::RecordNotFound
    render 'shared/404', status: :not_found
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def derivative_params
    params.require(:derivative).permit(:capcode, :name, :bodystyle_id, :transmission, :fueltype, :doors, :model_id)
  end
end
