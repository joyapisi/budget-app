class ClothesController < ApplicationController
  before_action :set_cloth, only: %i[ show edit update destroy ]

  # GET /clothes or /clothes.json
  def index
    @user = current_user
    @clothes = Cloth.includes(:user).where(user_id: params[:user_id])
end

  # GET /clothes/1 or /clothes/1.json
  def show
  end

  # GET /clothes/new
  def new
    @cloth = Cloth.new
  end

  # GET /clothes/1/edit
  def edit
  end

  # POST /clothes or /clothes.json
  def create
    @cloth = Cloth.new(cloth_params)
    @user = current_user
    @cloth.user_id = @user.id

    respond_to do |format|
      if @cloth.save
        format.html { redirect_to user_cloth_url(@cloth), notice: "cloth was successfully created." }
        format.json { render :show, status: :created, location: @cloth }
      else
        format.html { render :new, status: :unprocessable_cloth }
        format.json { render json: @cloth.errors, status: :unprocessable_cloth }
      end
    end
  end

  # PATCH/PUT /clothes/1 or /clothes/1.json
  def update
    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to cloth_url(@cloth), notice: "cloth was successfully updated." }
        format.json { render :show, status: :ok, location: @cloth }
      else
        format.html { render :edit, status: :unprocessable_cloth }
        format.json { render json: @cloth.errors, status: :unprocessable_cloth }
      end
    end
  end

  # DELETE /clothes/1 or /clothes/1.json
  def destroy
    @cloth.destroy

    respond_to do |format|
      format.html { redirect_to clothes_url, notice: "cloth was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cloth
      @cloth = Cloth.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cloth_params
      params.require(:cloth).permit(:name, :user_id, :group_id, :author_id, :amount)
    end
end
