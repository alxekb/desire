FactoryBot.define do
  factory :user do
    login { Faker::FunnyName.name }
    password { 123123123 }
    name { Faker::Name.name }
    signature { Faker::Quote.famous_last_words }

    factory :post do
      user
      title {  Faker::Lorem.title }
      notice { Faker::Lorem.sentence }
      content { Faker::Lorem.paragraph }
      published { false }
    end
  end
end
