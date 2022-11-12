class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :location


  def self.filter_products(params,user)
    if params[:category_id].nil?
      @products = Product.where(user_id: user.id)
      return @products
    end
    if params[:category_id].empty? && params[:location_id].empty?
      @products = Product.where(user_id: user.id)
    elsif !params[:category_id].empty? && !params[:location_id].empty?
      location = Location.find(params[:location_id])
      @products = Product.where(category_id: params[:category_id],user_id: user.id, location_id:location.id)
    elsif params[:category_id].empty? && !params[:location_id].empty?
      location = Location.find(params[:location_id])
      @products = Product.where(user_id: user.id, location_id:location.id)
    else
      @products = Product.where(category_id: params[:category_id],user_id: user.id)
    end
    @products
  end



  def self.create_product_qr_code(product)
  #  binding.pry
  qrcode = RQRCode::QRCode.new("http://192.168.1.183:3000/products/#{product.id}")
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
  IO.binwrite("/Users/vb/inventory_app/app/assets/images/#{product.name}.png", @png.to_s)
  end

  def self.display_qr_code(product)
    image_tag("/assets/#{product.name}.png", height: 50)
  end

end
