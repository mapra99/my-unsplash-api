FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.usernames }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
  end
end
