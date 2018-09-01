require "rails_helper"

RSpec.describe "Product management", :type => :request do
  describe "new product's page" do
    it "creates a product and redirects to the product's page" do
      get "/products/new"
      expect(response).to render_template(:new)
      @category = FactoryGirl.create(:category)
      post "/products", :product => {:title => "Web developer rails 5.0", :description => "This is a test", :image_url => "/images/2.jpg", :price => "20.50", :category_id => "#{@category.cat_id}"}

      expect(response).to redirect_to(assigns(:product))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Product was successfully created.")
    end

    it "does not render a different template" do
      get "/products/new"
      expect(response).to_not render_template(:show)
    end
  end

  before( :each ) do
    @category = FactoryGirl.create(:category)
    @product = FactoryGirl.create(:product, category_id: "#{@category.cat_id}")
  end

  describe "edit product's page" do
    it "edit a product and redirects to the show product's page" do
      get "/products/#{@product.id}/edit"
      expect(response).to render_template(:edit)
      put "/products/#{@product.id}", :product => {:title => "Web developer rails 5.0", :description => "This is a test", :image_url => "/images/2.jpg", :price => "20.50", :category_id => "#{@category.cat_id}"}

      expect(response).to redirect_to(assigns(:product))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Product was successfully updated.")
    end

    it "does not render a different template" do
      get "/products/#{@product.id}/edit"
      expect(response).to_not render_template(:show)
    end
  end

  describe "destroy process" do
    it "delete a product" do
      get "/products"
      delete "/products/#{@product.id}"

      expect(response).to redirect_to(products_url)
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to include("Product was successfully destroyed.")
    end
  end
end