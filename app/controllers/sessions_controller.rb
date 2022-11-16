class SessionsController < ApplicationController

  def new
    @user = User.new
    render :"sessions/user_login"
  end

  def create
  #  binding.pry
    if params.keys.include?(:customer)
      @customer = Customer.find_by(username:params[:customer][:username])
      if @customer && @customer.authenticate(params[:customer][:password])
        session[:customer_id] = @customer.id
        redirect_to customer_path(@customer)
      else
        redirect_to customer_login_path
      end
    elsif params.keys.include?(:user)
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to homepage_path
      else
        redirect_to login_path
      end
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end


end
