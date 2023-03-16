class CheckoutController < ApplicationController
  def create 
    
    @user = current_user
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: 'Mon Panier',
          },
          unit_amount: (@total*100).to_i,
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
  end
end
