require 'spec_helper'
require 'rails_helper'

describe "manager/categories/new.html.erb" do
  it "renders a form to create a category" do
    assign(:category, mock_model(Category, :cat_id => "1234", :cat_name => "Test new", :cat_content => "This is a new test").as_new_record  )
    render
    rendered.should have_selector("form",  :method => "post", :action => manager_categories_path ) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end
end