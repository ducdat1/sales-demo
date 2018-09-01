require "rails_helper"

RSpec.describe "posts/edit" do
  before(:each) do
    @post = assign(:post, FactoryGirl.create(:post))
  end

  it "renders the form partial" do
    stub_template "posts/_form.html.erb" => "This content"
    render
    expect(rendered).to match /This content/
  end
end