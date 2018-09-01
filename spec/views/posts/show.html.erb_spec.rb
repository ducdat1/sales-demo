require "rails_helper"

RSpec.describe "posts/show" do
  it "displays the post with id: 1" do
    post = FactoryGirl.create(:post)
    controller.extra_params = { :id => post.id }

    expect(controller.request.fullpath).to eq post_path(post)
  end
end