require "rails_helper"

feature "#User management" do
  background do
    FactoryGirl.create(:user, email: 'a1@mulodo.com', password: '123456')
  end

  scenario "Sign up" do
    visit '/users/sign_up'

    within("#new_user") do
      expect(find('div[@class="form-group"]/label[@for="user_email"]')).to have_text('Email')
      fill_in 'Email', with: 'a2@mulodo.com'
      expect(find('div[@class="form-group"]/label[@for="user_password"]')).to have_text('Password')
      fill_in 'Password', with: '123456'
      expect(find('div[@class="form-group"]/label[@for="user_password_confirmation"]')).to have_text('Password confirmation')
      fill_in 'Password confirmation', with: '123456'
    end

    expect(find('form#new_user/div[@class="actions"]')).to have_button('Sign up')
    find('form#new_user/div[@class="actions"]').click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario "Sigin is success" do
    visit '/users/sign_in'

    within("#new_user") do
      expect(find('div[@class="form-group"]/label[@for="user_email"]')).to have_text('Email')
      fill_in 'Email', with: 'a1@mulodo.com'
      expect(find('div[@class="form-group"]/label[@for="user_password"]')).to have_text('Password')
      fill_in 'Password', with: '123456'
    end

    expect(find('form#new_user/div[@class="actions"]')).to have_button('Log in')
    find('form#new_user/div[@class="actions"]').click_button('Log in')
    expect(page).to have_content 'Signed in successfully.'
  end

  given(:other_user) { FactoryGirl.build(:user, email: 'a2@mulodo.com', password: '123456') }

  scenario "Signin is invalid" do
    visit '/users/sign_in'

    within("#new_user") do
      expect(find('div[@class="form-group"]/label[@for="user_email"]')).to have_text('Email')
      fill_in 'Email', with: other_user.email
      expect(find('div[@class="form-group"]/label[@for="user_password"]')).to have_text('Password')
      fill_in 'Password', with: other_user.password
    end
    
    expect(find('form#new_user/div[@class="actions"]')).to have_button('Log in')
    find('form#new_user/div[@class="actions"]').click_button('Log in')
    expect(page).to have_content 'Invalid Email or password.'
  end
end