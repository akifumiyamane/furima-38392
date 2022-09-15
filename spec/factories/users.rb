FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           { 'あア阿'}
    first_name            { 'あア阿'}
    family_name_kana      { 'ア'}
    first_name_kana       { 'ア'}
    birthday              {Faker::Date.birthday}
  end
end