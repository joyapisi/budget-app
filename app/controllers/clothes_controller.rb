class ClothesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cloth, only: %i[show edit update destroy]

  # GET /clothes or /clothes.json
  def index
    @user = current_user
    @clothes = Cloth.where(user_id: current_user.id).order('created_at DESC')
  end

  # GET /clothes/1 or /clothes/1.json
  def show; end

  # GET /clothes/new
  def new
    if current_user.id.to_i == Group.find(params[:group_id]).user_id.to_i
      @cloth = Cloth.new
      @groups = Group.where(user_id: current_user.id)
    else
      redirect_to '/'
    end
  end

  # GET /clothes/1/edit
  def edit; end

  # POST /clothes or /clothes.json
  def create
    @cloth = Cloth.new(cloth_params)
    @user = current_user
    @cloth.user_id = @user.id
    @cloth.group_id = params[:group_id]


    if params[:cloth][:selected_ids]
      if save_and_group_cloth
        redirect_to group_path(params[:group_id])
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cloth.errors, status: :unprocessable_entity }
      end
    else
      redirect_to group_clothes_path(params[:group_id]), alert: 'please select at least one group.'
    end
  end

  # PATCH/PUT /clothes/1 or /clothes/1.json
  def update
    respond_to do |format|
      if @cloth.update(cloth_params)
        format.html { redirect_to cloth_url(@cloth), notice: 'cloth was successfully updated.' }
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
      format.html { redirect_to clothes_url, notice: 'cloth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def save_and_group_cloth
    ActiveRecord::Base.transaction do
      @cloth.save
      params[:cloth][:selected_ids].each do |id|
        GroupCloth.create(cloth_id: @cloth.id, group_id: id.to_i)
      end
    end
  rescue ActiveRecord::RecordInvalid
    false
  end
  
  def set_cloth
    @cloth = Cloth.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cloth_params
    params.require(:cloth).permit(:name, :amount)
  end

  def selection_params
    params.require(:cloth).permit(:selected_ids)
  end

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to landing_page_path
    end
  end
end
