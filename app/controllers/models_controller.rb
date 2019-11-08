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
