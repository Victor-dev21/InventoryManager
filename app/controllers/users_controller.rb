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
    qrcode = RQRCode::QRCode.new("http://192.168.1.183:3000/home")

  # NOTE: showing with default options specified explicitly
  @png = qrcode.as_png(
    bit_depth: 1,
    border_modules: 4,
    color_mode: ChunkyPNG::COLOR_GRAYSCALE,
    color: "black",
    file: nil,
    fill: "white",
    module_px_size: 6,
    resize_exactly_to: false,
    resize_gte_to: false,
    size: 120
  )
  #IO.binwrite("/Users/vb/inventory_app/app/assets/images/test3.png", @png.to_s)
    @user = User.find(session[:user_id])
    @products = Product.filter_products(params,@user)
    render :'users/home'
  end


private
def user_params
  params.require(:user).permit(:username,:password)
end

end
