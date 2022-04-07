class Customer::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @post_images = @customer.post_images
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end
  
  # 退会確認画面
  def unsubscribe
  end

  # 退会処理
  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

end