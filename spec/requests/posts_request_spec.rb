require "rails_helper"

RSpec.describe "Post management", :type => :request do
  it "assigns @posts" do
    post = FactoryGirl.create(:post)
    get "/posts"
    expect(assigns(:posts)).to eq([post])
  end

  it "renders the index template" do
    get "/posts"
    expect(response).to render_template :index
  end

  it "renders the show template" do
    @post = FactoryGirl.create(:post)
    get post_path(@post.id)
    expect(response).to render_template(:show)
  end

  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  it "creates a Post and renders the show template" do
    get "/posts/new"
    expect(response).to render_template(:new)

    post "/posts", params: { post: { title: "Post title", content: "Post content 10", quantity: 10 } }
    expect(response).to redirect_to(assigns(:post))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Post was successfully created.")
  end

  it 'update Post' do
    @post = FactoryGirl.create(:post)
    put post_path(@post.id, post: FactoryGirl.attributes_for(:post, title: "New Title"))
    @post.reload
    expect(@post.title).to eq("New Title")
  end

  it "delete Post" do
    @post = FactoryGirl.create(:post)
    delete post_path(@post.id)
    expect(response).to redirect_to posts_url
  end
end