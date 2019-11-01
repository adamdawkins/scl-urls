class ModelRangesController < ApplicationController
  before_action :set_model_range, only: [:show, :edit, :update, :destroy]

  # GET /model_ranges
  # GET /model_ranges.json
  def index
    @model_ranges = ModelRange.all
  end

  # GET /model_ranges/1
  # GET /model_ranges/1.json
  def show
  end

  # GET /model_ranges/new
  def new
    @model_range = ModelRange.new
  end

  # GET /model_ranges/1/edit
  def edit
  end

  # POST /model_ranges
  # POST /model_ranges.json
  def create
    @model_range = ModelRange.new(model_range_params)

    respond_to do |format|
      if @model_range.save
        format.html { redirect_to @model_range, notice: 'Model range was successfully created.' }
        format.json { render :show, status: :created, location: @model_range }
      else
        format.html { render :new }
        format.json { render json: @model_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /model_ranges/1
  # PATCH/PUT /model_ranges/1.json
  def update
    respond_to do |format|
      if @model_range.update(model_range_params)
        format.html { redirect_to @model_range, notice: 'Model range was successfully updated.' }
        format.json { render :show, status: :ok, location: @model_range }
      else
        format.html { render :edit }
        format.json { render json: @model_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /model_ranges/1
  # DELETE /model_ranges/1.json
  def destroy
    @model_range.destroy
    respond_to do |format|
      format.html { redirect_to model_ranges_url, notice: 'Model range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_range
      @model_range = ModelRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_range_params
      params.require(:model_range).permit(:name, :slug, :manufacturer_id)
    end
end
