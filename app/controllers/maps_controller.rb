class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:show, :edit, :update, :destroy]
  # GET /maps
  # GET /maps.json
  def index
    #@maps = Map.all
    @maps = current_user.maps
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
	if @map
	delta = @map.radius.to_f/111000
	lat = @map.latitude
	min_latitude = lat - delta
	max_latitude = lat + delta
	lng = @map.longtitude
	min_longtitude = lng - delta
	max_longtitude = lng + delta
	@things = Thing.where("longtitude >= :min_lng AND longtitude <= :max_lng AND latitude >= :min_lat AND latitude <= :max_lat",{min_lng: min_longtitude,max_lng: max_longtitude,min_lat: min_latitude,max_lat: max_latitude})
	end
  end

  # GET /maps/new
  def new
    redirect_to root_url
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'Map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    def correct_user
      @map = current_user.maps.find_by(id: params[:id])
      redirect_to root_url if @map.nil?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:zoom, :user_id, :radius, :float, :latitude, :longtitude)
    end
end
