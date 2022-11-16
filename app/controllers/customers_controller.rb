class CustomersController < ApplicationController

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
      session[:user_id] = @customer.id
      binding.pry
      redirect_to customers_path
    end
  end

  def login
    @customer = Customer.new
    render :"sessions/customer_login"
  end

  def show

  end

  def edit

  end
private
def customer_params
  params.require(:customer).permit(:username, :password)
end

end
