class PaymentsController < ApplicationController
 
 def create
   @product = Product.find(params[:product_id])
     if user_signed_in?
      @user = current_user
    else
      @user = User.new(id: 99)
    end
  
  token = params[:stripeToken]
  # Create the charge on Stripe's servers - this will charge the user's card
  begin
    charge = Stripe::Charge.create(
      amount: (@product.price * 100).to_i, # amount in cents, again
      currency: "usd",
      source: token,
      description: params[:stripeEmail]
    )
    
    if charge.paid
      Order.create(
        user_id: @user.id,
        product_id: params[:product_id],
        total: @product.price)    
    end
    
  rescue Stripe::CardError => e
    # The card has been declined
    body = e.json_body
    err = body[:error]
    flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
  end
  redirect_to product_path(@product)
  end 
  
end
