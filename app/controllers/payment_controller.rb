require 'stripe'
class PaymentController < ApplicationController
  def pay
    if params.has_key?(:name) && params.has_key?(:email) && params.has_key?(:telephone) && params.has_key?(:quantity) &&  params.has_key?(:delivery) &&  params.has_key?(:instructions) && params.has_key?(:stripeToken)
      Stripe.api_key = 'sk_test_gEaFjlOfJvnGtpMxejGSf2rw'
      # Get the credit card details submitted by the form
      token = params[:stripeToken]
      money = params[:quantity].to_i*700
      if params[:delivery] == "True"
        money+=100
      end
      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
          :amount => money, # amount in cents, again
          :currency => "usd",
          :source => token,
          :description => params[:quantity] + "x LiveGlass"
        )
        ord = Order.new(name: params[:name],email: params[:email],telephone: params[:telephone],quantity: params[:quantity],delivery: params[:delivery], instructions: params[:instructions], stripeToken: params[:stripeToken])
        
        if ord.save
          OrderConfirmation.confirm(params).deliver_later
          redirect_to root_path(anchor: 'payment_section'), :flash => { :notice => "You successfully bought " + params[:quantity] + " LiveGlass!" }
        else

          redirect_to root_path(anchor: 'payment_section'), :flash => { :error => "Error, could not process request. Please try again." }
        end
      rescue Stripe::CardError => e
        redirect_to root_path(anchor: 'payment_section'), :flash => { :error => "Payment did not go through. " + e.message }
      end
    else
      redirect_to root_path(anchor: 'payment_section'), :flash => { :error => "Missing fields. "}
    end
  end
end 
