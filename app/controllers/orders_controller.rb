class OrdersController < ApplicationController
  layout "customer_navbar", only:[:index,:show] # Don't render a layout

  def index
    @current_user = nil
    if session.keys.include?("customer_id")
      @current_user = Customer.find(session[:customer_id])
      @all_orders = ProductsOrder.where(customer:@current_user)
    elsif session.keys.include?("user_id")
      @current_user = User.find(session[:user_id])
      @all_orders = ProductsOrder.where(user:@current_user)
    end
  end
  def create
    #ProductsOrder.create(product:@product,quantity: params[:qty],order:@order)
    #binding.pry
    @customer = Customer.find(session[:customer_id])
    session[:cart].each do |product|
      @order = Order.new(customer: @customer,user:User.find(product["product"]["user_id"]))
      ProductsOrder.create(product:Product.find(product["product"]["id"]),quantity: product["quantity"],order:@order)
    end
    session[:cart] = []
    redirect_to orders_path
  end

  def show

  end
end
