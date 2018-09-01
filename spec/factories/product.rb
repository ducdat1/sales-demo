# spec/factories/product_form.rb
require 'faker'

FactoryGirl.define do
  factory :product do |f|
    f.title {Faker::Book.title}
    f.description {Faker::WorldOfWarcraft.quote}
    f.image_url "/images/2.jpg"
    f.price {Faker::Number.non_zero_digit}
  end

  factory :invalid_product, parent: :product do |f|
    f.title nil
  end

end