class ManufacturersController < ApplicationController
  before_action :set_channel
  before_action :set_manufacturer

  # GET /:channel_id/:slug
  # GET /car-leasing/audi
  def show; end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'shared/404', status: :not_found
  end

  def set_channel
    @channel = Channel.friendly.find(params[:channel_id])
  rescue ActiveRecord::RecordNotFound
    render 'shared/404', status: :not_found
  end
end
