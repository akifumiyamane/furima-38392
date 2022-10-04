class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @donation_address = DonationAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id == @item.user.id
    if @item.user == current_user
      redirect_to root_path
    end  
  end  


  
  def create
    @item = Item.find(params[:item_id])
    @donation_address = DonationAddress.new(donation_params)
    if @donation_address.valid?
      pay_item
       @donation_address.save
       redirect_to root_path
    else
      render :index
    end
  end  

  private

  def donation_params
    params.require(:donation_address).permit(:code, :prefecture_id, :building, :municipality, :address, :phone).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end  

  def pay_item
    Payjp.api_key = "sk_test_8e5378a5b708c19c22786890"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: donation_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end


end
