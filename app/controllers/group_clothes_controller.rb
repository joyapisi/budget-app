class GroupClothesController < ApplicationController
  before_action :set_group_cloth, only: %i[ show edit update destroy ]

  # GET /group_clothes or /group_clothes.json
  def index
    @group_clothes = GroupCloth.all
  end

  # GET /group_clothes/1 or /group_clothes/1.json
  def show
  end

  # GET /group_clothes/new
  def new
    @group_cloth = GroupCloth.new
  end

  # GET /group_clothes/1/edit
  def edit
  end

  # POST /group_clothes or /group_clothes.json
  def create
    @group_cloth = GroupCloth.new(group_cloth_params)

    respond_to do |format|
      if @group_cloth.save
        format.html { redirect_to group_cloth_url(@group_cloth), notice: "Group cloth was successfully created." }
        format.json { render :show, status: :created, location: @group_cloth }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_clothes/1 or /group_clothes/1.json
  def update
    respond_to do |format|
      if @group_cloth.update(group_cloth_params)
        format.html { redirect_to group_cloth_url(@group_cloth), notice: "Group cloth was successfully updated." }
        format.json { render :show, status: :ok, location: @group_cloth }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_cloth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_clothes/1 or /group_clothes/1.json
  def destroy
    @group_cloth.destroy

    respond_to do |format|
      format.html { redirect_to group_clothes_url, notice: "Group cloth was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_cloth
      @group_cloth = GroupCloth.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_cloth_params
      params.require(:group_cloth).permit(:cloth_id, :group_id)
    end

    def update_group_total_amount
      group.total_amount = group.total_amount + cloth.amount
      group.save
    end
end
