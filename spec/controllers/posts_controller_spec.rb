require "rails_helper"

RSpec.describe PostsController, :type => :controller do

  describe "#index" do
    it "assigns @posts" do
      post = FactoryGirl.create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "#show" do
    it "assigns @post" do
      post = FactoryGirl.create(:post)
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
    
    it "renders the show template" do
      get :show,  params: { id: FactoryGirl.create(:post).id }
      expect(response).to render_template :show
    end
  end

  describe "#create" do
    login_user
    context "when attributes is valid" do
      new_post = { title: 'Post title', content: 'Post content', quantity: 1 }
      it "creates a new post" do
        expect do
          post :create, params: { post: new_post }
        end.to change(Post,:count).by(1)
      end
      
      it "redirects to the post" do
        post :create, params: { post: new_post }
        expect(response).to redirect_to Post.last
      end
    end

    context "when attributes is invalid" do
      invalid_post = { title: nil, content: 'Post content', quantity: 1 }
      it "does not save the new post" do
        expect do
          post :create, params: { post: invalid_post }
        end.to_not change(Post,:count)
      end
      
      it "re-renders the new method" do
        post :create, params: { post: invalid_post }
        expect(response).to render_template :new
      end
    end
  end

  describe '#update' do
    login_user
    before :each do
      @post = FactoryGirl.create(:post)
    end
    
    context "when attributes is valid" do
      it "assigns requested @post" do
        put :update, params: { id: @post, post: FactoryGirl.attributes_for(:post) }
        expect(assigns(:post)).to eq(@post)      
      end
    
      it "changes attributes" do
        put :update, params: { id: @post, post: FactoryGirl.attributes_for(:post, title: "Post title 2", content: "Post content 2") }
        @post.reload
        expect(@post.title).to eq("Post title 2")
        expect(@post.content).to eq("Post content 2")
      end
    
      it "redirects to the updated" do
        put :update, params: { id: @post, post: FactoryGirl.attributes_for(:post) }
        expect(response).to redirect_to @post
      end
    end
    
    context "when attributes is invalid" do
      it "assigns requested @post" do
        put :update, params: { id: @post, post: FactoryGirl.attributes_for(:post, title: nil, content: nil) }
        expect(assigns(:post)).to eq(@post)      
      end
      
      it "does not change @post" do
        put :update, params: { id: @post, post: FactoryGirl.attributes_for(:post, title: nil, content: nil) }
        @post.reload
        expect(@post.title).not_to eq("Post title 3")
        expect(@post.content).not_to eq("Post content 3")
      end
      
      it "re-renders the edit method" do
        put :update, params: { id: @post, post: FactoryGirl.attributes_for(:post, title: nil, content: nil) }
        expect(response).to render_template :edit
      end
    end
  end

  describe "#destroy" do
    login_user
    before :each do
      @post = FactoryGirl.create(:post)
    end
    
    it "deletes the post" do
      expect{
        delete :destroy, params: { id: @post }
      }.to change(Post,:count).by(-1)
    end
      
    it "redirects to post#index" do
      delete :destroy, params: { id: @post }
      expect(response).to redirect_to posts_url
    end
  end

end