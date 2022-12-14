class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.order(created_at: :DESC)
    
  end 
  
  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new    
    end  
  end

  def show
  end  

  def edit
    return redirect_to action: :index unless @item.user_id == current_user.id
    if  @item.purchase_record != nil
      redirect_to root_path
    end  
  end  

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user != current_user
      redirect_to root_path
    else
      item.destroy  
      redirect_to root_path
    end 
  end  

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :description_id, :status_id, :delivery_charge_bearer_id, :prefecture_id, :price, :information, :image).merge(user_id: current_user.id)
  end  

  def set_item
    @item = Item.find(params[:id])
  end  
end
