require "rails_helper"

RSpec.feature "Product management", :type => :feature do
  scenario "Creates a new product" do
    visit "/products/new"
    @category = FactoryGirl.create(:category)
    fill_in "Title",       :with => "Web developer rails 5.0"
    fill_in "Description", :with => "This is a test"
    fill_in "Image url",   :with => "/images/2.jpg"
    fill_in "Price",       :with => "20.50"
    click_button "Create Product"

    expect(page).to have_text("Product was successfully created.")
  end
  scenario "Edit a product" do
    @category = FactoryGirl.create(:category)
    @product = FactoryGirl.create(:product, category_id: "#{@category.cat_id}")
    visit "/products/#{@product.id}/edit"
    fill_in "Title",       :with => "Web developer rails 5.0"
    fill_in "Description", :with => "This is a test"
    fill_in "Image url",   :with => "/images/3.jpg"
    fill_in "Price",       :with => "20.50"
    click_button "Update Product"

    expect(page).to have_text("Product was successfully updated.")
  end
  scenario "Delete a product" do
    @category = FactoryGirl.create(:category)
    @product = FactoryGirl.create(:product, category_id: "#{@category.cat_id}")
    visit "/products"
    click_link 'Destroy'
    expect(page).to have_content 'Product was successfully destroyed.'
    expect(page).not_to have_content @product.title
  end
end