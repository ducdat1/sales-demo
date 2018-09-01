require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :firstname => "Firstname",
      :lastname => "Lastname",
      :email => "Email",
      :city => "City",
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Firstname/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
  end
end
