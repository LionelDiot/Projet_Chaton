class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    
    if session[:cart] && session[:cart][:pending_photo]
      @cart = Cart.find_or_create_by(user_id: current_user.id)
      @cart.add_photo_to_cart(Photo.find(session[:cart][:pending_photo][:id]))
      redirect_to photos_path, notice: "Photo ajoutée au panier"
      session[:cart] = nil
    end
    super
  end


end
