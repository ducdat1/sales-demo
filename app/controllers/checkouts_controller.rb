class CheckoutsController < ApplicationController
  # before_action :set_locale, :authorize
  # before_action :set_product, only: [:show, :edit, :update, :destroy]

  def checkout
    @cart = current_cart
    render 'carts/checkout'
  end

  def confirm
    @cart = current_cart
    render 'carts/checkout'
  end

end