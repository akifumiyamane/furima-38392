FactoryBot.define do
  factory :item do
    name                        {"名前"}
    category_id                 {2}
    description_id              {2}
    status_id                   {2}
    delivery_charge_bearer_id   {2}
    prefecture_id               {2}
    price                       {2000}
    information                 {"説明"}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('spec/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
