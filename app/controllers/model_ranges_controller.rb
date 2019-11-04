class ModelRangesController < ApplicationController
  before_action :set_channel
  before_action :set_manufacturer
  before_action :set_model_range

  # GET /:channel_id/:manufacturer_id/:id
  # GET /car-leasing/audi/a3
  def show
    return render(:show) unless @model_range.models.count == 1

    redirect_to model_path(@channel,
                           @manufacturer,
                           @model_range,
                           @model_range.models.first)
  end

  private

  def set_model_range
    @model_range = ModelRange.friendly.find(params[:id])
  end

  def set_manufacturer
    @manufacturer = Manufacturer.friendly.find(params[:manufacturer_id])
  end

  def set_channel
    @channel = Channel.friendly.find(params[:channel_id])
  end
end
