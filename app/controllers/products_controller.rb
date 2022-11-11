require 'pry'
class ProductsController < ApplicationController

  def index
    @products = Product.all
  end


  def new
    @product = Product.new()
  end

  def create
    puts params
    @user = User.find(session[:user_id])
    @product = Product.create(product_params)
    @product.category = Category.find(params[:product][:category_id])

    if(!params[:product][:location].empty?)
      @location = Location.find_or_create_by(name:params[:product][:location])
      @product.location = @location
    else
      @location = Location.find(params[:product][:location_id])
      #binding.pry
      @product.location = @location
    end
    @product.save
    @user.products << @product
    Product.create_product_qr_code(@product)
    redirect_to homepage_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    @location = Location.find_or_create_by(name: params[:product][:location][:name])
    @product.location = @location
    @product.category = Category.find(params[:product][:category_id])
    @product.save
    redirect_to homepage_path
  end


  private
  def product_params
    params.require(:product).permit(:name,:quantity,:price)
  end
end
