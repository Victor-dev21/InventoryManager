require 'barby'
require 'rqrcode'
require 'barby/barcode'
require 'barby/outputter/png_outputter'
require 'barby/outputter/ascii_outputter'
require 'chunky_png'
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if(@user.save)
      session[:user_id] = @user.id
      redirect_to homepage_path
    else
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
    @products = Product.filter_products(params,@user)
    render :'users/home'
  end


private
def user_params
  params.require(:user).permit(:username,:password)
end

end
