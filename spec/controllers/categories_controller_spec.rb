require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  describe "GET #index" do
    it "this is a test" do
      category = FactoryGirl.create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe "GET #show" do
    it "show page view" do
      category = FactoryGirl.create(:category)
      get :show, id: category
      expect(assigns(:category)).to eq(category)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:category)
      expect(response).to render_template :show
    end
  end
end