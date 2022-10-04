class PurchaseRecord < ApplicationRecord
  belongs_to :user
  has_one :destination
end
