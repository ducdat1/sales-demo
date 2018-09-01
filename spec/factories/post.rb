require 'faker'
FactoryGirl.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::Book.description }
    quantity { Faker::Random.rand(1..100) }
  end

  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
  end
end