require 'rails_helper'

RSpec.describe Manager::CategoriesController, :type => :controller do
  #Test for controller index
  describe "GET #index" do
    it "this is a index test" do
      category = FactoryGirl.create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  #Test for controller show
  describe "GET #show" do
    it "show page manager view" do
      @category = FactoryGirl.create(:category)
      get :show, id: @category
      expect(assigns(:category)).to eq(@category)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:category)
      expect(response).to render_template :show
    end
  end
  #Test for controller new
  describe "GET #new" do
    # it "new category" do
    #   get :new
    #   expect(assigns(:category)).to eq %w(cat_id cat_name cat_content)
    # end
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  #Test for controller edit
  describe "GET #edit" do
    it "edit category" do
      @category = FactoryGirl.create(:category)
      get :edit, id: @category
      expect(assigns(:category)).to eq(@category)
    end
    it "renders the :edit template" do
      get :edit, id: FactoryGirl.create(:category)
      expect(response).to render_template :edit
    end
  end
  #Test for controller create data
  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new category" do
        expect{
          post :create, category: FactoryGirl.attributes_for(:category)
        }.to change(Category,:count).by(1)
      end

      it "redirects to the new category" do
        post :create, category: FactoryGirl.attributes_for(:category)
        response.should redirect_to Category.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new category" do
        expect{
          post :create, category: FactoryGirl.attributes_for(:invalid_category)
        }.to_not change(Category,:count)
      end

      it "re-renders the new method" do
        post :create, category: FactoryGirl.attributes_for(:invalid_category)
        response.should render_template :new
      end
    end
  end
  #Test for controller update data
  describe "PUT #update" do
    before :each do
      @category = FactoryGirl.create(:category)
    end
    context "valid attributes" do
      it "located the requested @category" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:category, cat_id: @category.cat_id)
        assigns(:category).should eq(@category)
      end

      it "changes @category's attributes" do
        put :update, id: @category,
            category: FactoryGirl.attributes_for(:category, cat_id: @category.cat_id, cat_name: "testspec", cat_content: "this is a test")
        @category.reload
        @category.cat_name.should eq("testspec")
        @category.cat_content.should eq("this is a test")
      end

      it "redirects to the updated category" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:category, cat_id: @category.cat_id)
        response.should redirect_to @category
      end
    end
    context "invalid attributes" do
      it "locates the requested @category" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:invalid_category,  cat_id: @category.cat_id)
        assigns(:category).should eq(@category)
      end

      it "does not change @category's attributes" do
        put :update, id: @category,
            category: FactoryGirl.attributes_for(:category, cat_id: @category.cat_id, cat_name: "testspec", cat_content: nil)
        @category.reload
        @category.cat_name.should_not eq("testspec")
        @category.cat_content.should eq(@category.cat_content)
      end

      it "re-renders the edit method" do
        put :update, id: @category, category: FactoryGirl.attributes_for(:invalid_category, cat_id: @category.cat_id)
        response.should render_template :edit
      end
    end
  end
  #Test for controller delete data
  describe "DELETE #destroy" do
    before :each do
      @category = FactoryGirl.create(:category)
    end

    it "deletes the category" do
      expect{
        delete :destroy, id: @category
      }.to change(Category,:count).by(-1)
    end

    it "redirects to category#index" do
      delete :destroy, id: @category
      response.should redirect_to categories_url
    end
  end

end