FactoryBot.define do
  factory :character do
    name { Faker::Internet.user_name }
    level { Faker::Number.between(1, 10) }
    experience { Faker::Number.decimal }
    energy { Faker::Number.between(0, 100) }
    money { Faker::Number.decimal }
    strength { Faker::Number.between(1, 100) }
    agility { Faker::Number.between(1, 100) }
    intelligence { Faker::Number.between(1, 100) }
    user
  end
end
