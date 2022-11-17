require 'pry'
class CustomersController < ApplicationController
  layout "customer_navbar", only:[:index,:show] # Don't render a layout

  def index
    @customer = Customer.new
  end

  def new
    @customer = Customer.new
  end
  def create
    @customer = Customer.new(customer_params)
    puts params
    puts @customer.save
    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to customers_path
    end
  end

  def login
    @customer = Customer.new
    render :"sessions/customer_login"
  end

  def cart
    @customer = Customer.find(session[:customer_id])
    @product = Product.find(params[:product_id])
    if !session.include?("cart")
      session[:cart] = []
      session[:cart] << {product:@product,quantity:params[:qty]}
    else
      session[:cart] << {product:@product,quantity:params[:qty]}
    end
    redirect_to cart_path
  end

  def show
    @customer = Customer.find(session[:customer_id])
  end

  def edit

  end
private
def customer_params
  params.require(:customer).permit(:username, :password)
end

end
