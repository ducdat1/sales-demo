require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :firstname => "MyString",
      :lastname => "MyString",
      :email => "MyString",
      :city => "MyString",
      :state => "MyString"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_firstname[name=?]", "person[firstname]"

      assert_select "input#person_lastname[name=?]", "person[lastname]"

      assert_select "input#person_email[name=?]", "person[email]"

      assert_select "input#person_city[name=?]", "person[city]"

      assert_select "input#person_state[name=?]", "person[state]"
    end
  end
end
