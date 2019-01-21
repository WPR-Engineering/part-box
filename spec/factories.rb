FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password {"password"}
    password_confirmation {"password"}
  end
end


FactoryBot.define do
  factory :asset_tag do
    tag {"TAG-0001"}
    location_id {"980190963"}
  end
end

FactoryBot.define do
  factory :location do
    id { "1" }
    name { Faker::Coffee.origin }
  end
end
