class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @donation_address = DonationAddress.new
    return redirect_to root_path unless current_user.id != @item.user.id
    if @item.purchase_record != nil
      redirect_to root_path
    end  
  end  


  
  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: donation_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end


end
