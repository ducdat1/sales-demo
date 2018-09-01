 require "rails_helper"

  RSpec.describe "posts/index" do
    it "has a request.fullpath that is defined" do
      expect(controller.request.fullpath).to eq posts_path
    end
  end