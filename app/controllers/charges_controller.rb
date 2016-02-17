class ChargesController < ApplicationController
  def create
    begin
      customer = Stripe::Customer.create(
        email: current_user.email,
        card: params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: Amount.default,
        description: "BigMoney Membership - #{current_user.email}",
        currency: 'usd'
      )

      flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay my again."
      redirect_to user_path(current_user)

    rescue Stripe::CardError => e
      flash.now[:alert] = e.message
      redirect_to new_charge_path
    end

  end


  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "BigMoney Membership - #{current_user.email}",
      amount: Amount.new.default
    }
  end
end
