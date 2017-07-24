class ChargesController < ApplicationController
  def create
    @user = current_user
    # Creates a Stripe Customer object, for associating with the charge
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 15_00,
      description: "Upgrade to Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    @user.update_attributes(role: 'premium')

    flash[:notice] = "Thank you for upgrading to premium membership, #{current_user.email}!"
    redirect_to root_path

    rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Upgrade to Premium Membership - #{current_user}",
      amount: 15_00
    }
  end
end
