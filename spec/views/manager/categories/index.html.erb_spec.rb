require "spec_helper"
require 'rails_helper'

describe "manager/categories/index.html.erb" do
  before(:each) do
    @category = FactoryGirl.create(:category)
  end
  it "displays all the categories" do
    assign(:categories, [
        mock_model(Category, :cat_id => @category.cat_id),
        mock_model(Category, :cat_name => @category.cat_name),
        mock_model(Category, :cat_content => @category.cat_content)
    ])

    render

    rendered.should match("#{@category.cat_id}")
    rendered.should match("#{@category.cat_name}")
    rendered.should match("#{@category.cat_content}")
  end
end