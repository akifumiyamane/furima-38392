FactoryBot.define do
  factory :donation_address do
    code { '123-4567' }
    prefecture_id {2}
    municipality { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone { '12345678910' }
    token {'token_100'}
  end 
end
