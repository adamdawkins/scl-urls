class ChannelsController < ApplicationController
  def show
    @channel = Channel.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, status: :not_found
  end
end
