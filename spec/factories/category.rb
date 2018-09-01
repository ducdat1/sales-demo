# spec/factories/category.rb
require 'faker'

FactoryGirl.define do
  factory :category do |f|
    f.cat_id {Faker::IDNumber.valid}
    f.cat_name {Faker::Book.title}
    f.cat_content {Faker::WorldOfWarcraft.quote}
  end

  factory :invalid_category, parent: :category do |f|
    f.cat_name nil
  end

end