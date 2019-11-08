class ModelsController < ApplicationController
  before_action :set_model, only: [:show, :edit, :update, :destroy]
  before_action :set_model_range
  before_action :set_manufacturer
  before_action :set_channel

  # GET /models
  # GET /models.json
  def index
    @models = Model.all
  end

  # GET /models/1
  # GET /models/1.json
  def show; end

  # GET /models/new
  def new
    @model = Model.new
  end

  # GET /models/1/edit
  def edit; end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    respond_to do |format|
      if @model.save
        format.html { redirect_to @model, notice: 'Model was successfully created.' }
        format.json { render :show, status: :created, location: @model }
      else
        format.html { render :new }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    respond_to do |format|
      if @model.update(model_params)
        format.html { redirect_to @model, notice: 'Model was successfully updated.' }
        format.json { render :show, status: :ok, location: @model }
      else
        format.html { render :edit }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to models_url, notice: 'Model was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_model
    @model = Model.friendly.find(params[:id])
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

  def model_params
    params.require(:model).permit(:name, :slug, :model_range_id)
  end
end
