FactoryBot.define do
  factory :user do
    login { Faker::FunnyName.name }
    password { 123123123 }
    name { Faker::Name.name }
    signature { Faker::Quote.famous_last_words }
  end

  factory :post do
    title {  Faker::Lorem.sentence }
    notice { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published { true }
    association(:user)
  end
end
