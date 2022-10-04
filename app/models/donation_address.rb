class DonationAddress

  include ActiveModel::Model
  attr_accessor :code, :prefecture_id, :address, :building, :phone, :municipality, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/ }  
    validates :token, presence: true
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(code: code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone: phone, purchase_record_id: purchase_record.id)
  end  
end  