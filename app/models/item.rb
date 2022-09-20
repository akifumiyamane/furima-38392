class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_charge_bearer
  belongs_to :description
  belongs_to :prefecture
  belongs_to :status
  has_one_attached :image
  belongs_to :user

  validates :name, presence: true
  validates :information, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_bearer_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :description_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
end
