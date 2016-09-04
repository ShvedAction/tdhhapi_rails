class VacansiesController < ApplicationController
  before_action :set_vacansy, only: [:show, :edit, :update, :destroy]

  # GET /vacansies
  # GET /vacansies.json
  def index
    #весь поиск по городу и по городам если params[:area_id] массив
    @vacansies = params[:area_id] ? Vacansy.where(area_id: params[:area_id]): Vacansy.all
    @vacansies.includes! :area
  end

  # GET /vacansies/1
  # GET /vacansies/1.json
  def show
  end

  # GET /vacansies/new
  def new
    @vacansy = Vacansy.new
  end

  # GET /vacansies/1/edit
  def edit
  end

  # POST /vacansies
  # POST /vacansies.json
  def create
    @vacansy = Vacansy.new(vacansy_params)

    respond_to do |format|
      if @vacansy.save
        format.html { redirect_to @vacansy, notice: 'Vacansy was successfully created.' }
        format.json { render :show, status: :created, location: @vacansy }
      else
        format.html { render :new }
        format.json { render json: @vacansy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacansies/1
  # PATCH/PUT /vacansies/1.json
  def update
    respond_to do |format|
      if @vacansy.update(vacansy_params)
        format.html { redirect_to @vacansy, notice: 'Vacansy was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacansy }
      else
        format.html { render :edit }
        format.json { render json: @vacansy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacansies/1
  # DELETE /vacansies/1.json
  def destroy
    @vacansy.destroy
    respond_to do |format|
      format.html { redirect_to vacansies_url, notice: 'Vacansy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacansy
      @vacansy = Vacansy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacansy_params
      params.require(:vacansy).permit(:area_id, :branded_description, :alternate_url, :name, :archived, :type_name, :published_at)
    end
end
