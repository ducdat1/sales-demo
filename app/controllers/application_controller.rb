class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
  protected
    def authorize
      if session[:user].nil?
        session[:return] = request.original_url
        redirect_to login_path, alert: 'You must login'
      else
        @user = User.find_by_id(session[:user]['id'])
        if @user.nil?
          session[:return] = request.original_url
          redirect_to login_path, alert: 'You must login'
        end
      end
    end
end