require "spec_helper"
require 'rails_helper'

describe "products/_form.html.erb" do
  before(:each) do
    @category = FactoryGirl.create(:category)
    @product = FactoryGirl.create(:product, category_id: @category.cat_id)
  end
  it "displays the product to edit" do
    product = mock_model(Product, :title => @product.title, :description => @product.description, :image_url => @product.image_url, :price => @product.price)
    @categories = Category.get_category
    render :partial => "products/form.html.erb", :locals => {:product => product}

    expect(rendered).to match("#{@product.title}")
    expect(rendered).to match("#{@product.description}")
    expect(rendered).to match("#{@product.image_url}")
    expect(rendered).to match("#{@product.price}")
  end
end