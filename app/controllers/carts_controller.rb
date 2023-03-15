class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show edit update destroy ]
  before_action :owner?, only: [:show, :destroy, :edit, :update]
  # GET /carts or /carts.json
  def index
    @carts = Cart.all
  end

  def add_to_cart
    @photo = Photo.find(params[:id])
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @cart.add_photo_to_cart(@photo)

    redirect_to photos_path, notice: "Photo ajoutée au panier"
  end

  # GET /carts/1 or /carts/1.json
  def show
    @cart = Cart.find_by(user_id: current_user.id)
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.create(user_id: current_user.id)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end

    def owner?
      @cart = set_cart
      unless current_user.id == @cart.user_id
        flash[:danger] = "Impossible vous n'êtes pas le propriétaire de ce panier !"
        redirect_to "/"
      end
    end
  
end
