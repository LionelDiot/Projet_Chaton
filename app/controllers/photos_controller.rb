class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show edit update destroy ]

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
  end

  def delete_photo
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @photo = Photo.find(params[:id])
    @cart.selections.where(photo_id: params[:id]).first.delete
    redirect_to cart_path(current_user.cart), notice: "Votre photo #{@photo.title} est supprimé de votre panier."
  end

  # GET /photos/1 or /photos/1.json
  def show
    @photo = Photo.find(params[:id])
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to photo_url(@photo), notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to photo_url(@photo), notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:price, :title, :description, :url)
    end
end
