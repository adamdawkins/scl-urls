class ChannelsController < ApplicationController
  def show
    @channel = Channel.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render 'shared/404', status: :not_found
  end
end
