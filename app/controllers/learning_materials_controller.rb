class LearningMaterialsController < ApplicationController
  before_action :set_learning_material, only: [:show, :edit, :update, :destroy]

  # GET /learning_materials
  # GET /learning_materials.json
  def index
    @learning_materials = LearningMaterial.all
  end

  # GET /learning_materials/1
  # GET /learning_materials/1.json
  def show
  end

  # GET /learning_materials/new
  def new
    @learning_material = LearningMaterial.new
  end

  # GET /learning_materials/1/edit
  def edit
  end

  # POST /learning_materials
  # POST /learning_materials.json
  def create
    @learning_material = LearningMaterial.new(learning_material_params)

    respond_to do |format|
      if @learning_material.save
        format.html { redirect_to @learning_material, notice: 'Learning material was successfully created.' }
        format.json { render :show, status: :created, location: @learning_material }
      else
        format.html { render :new }
        format.json { render json: @learning_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learning_materials/1
  # PATCH/PUT /learning_materials/1.json
  def update
    respond_to do |format|
      if @learning_material.update(learning_material_params)
        format.html { redirect_to @learning_material, notice: 'Learning material was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_material }
      else
        format.html { render :edit }
        format.json { render json: @learning_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learning_materials/1
  # DELETE /learning_materials/1.json
  def destroy
    @learning_material.destroy
    respond_to do |format|
      format.html { redirect_to learning_materials_url, notice: 'Learning material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learning_material
      @learning_material = LearningMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learning_material_params
      params.require(:learning_material).permit(:name, :source, :description, :duration, :difficulty)
    end
end
