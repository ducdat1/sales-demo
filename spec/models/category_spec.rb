require 'rails_helper'

describe Category, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:category).should be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:category, cat_name: nil).should_not be_valid
  end
  it "is invalid without a content" do
    FactoryGirl.build(:category, cat_content: nil).should_not be_valid
  end
end