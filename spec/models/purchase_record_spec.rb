require 'rails_helper'

RSpec.describe PurchaseRecord, type: :model do
  before do 
    @purchase_record = FactoryBot.build(:purchase_record)
  end  
end
