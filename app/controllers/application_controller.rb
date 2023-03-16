class ApplicationController < ActionController::Base
  

  def after_sign_in_path_for(resource)
    if session[:photo]
      # Add the pending item to the cart
      photo = Photo.find(session[:photo]["id"])
      current_user.cart.add_photo_to_cart(photo)
      session.delete(:photo)
    end
    super
  end

end
