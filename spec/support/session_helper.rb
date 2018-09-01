require 'spec_helper'

module SessionHelper
  def login_user
    let(:user_logging_in) { FactoryGirl.create(:user) }
    before(:each) do
      @request.env['authentication.mapping'] = Devise.mappings[:user]
      sign_in user_logging_in
    end
  end

end