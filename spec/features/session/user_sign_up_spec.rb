require 'rails_helper'

RSpec.feature "User signs up", :type => :feature do
  scenario 'with valid email and password' do
    visit register_path
    fill_in 'Email', with: 'test@mail.com'
    fill_in 'user_password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    within(".form") do
      click_on 'Sign up'
    end
    
    expect(page).to have_content('User created')
    expect(page).to have_content('Log out')
    expect(page).to have_content('Signed as:')
  end

  scenario 'with blank password' do
    visit register_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'user_password', with: ''
    fill_in 'Password confirmation', with: ''
    within(".form") do
      click_on 'Sign up'
    end
    
    expect(page).to have_content("can't be blank")
  end
  
  scenario 'with invalid email' do
    visit register_path
    fill_in 'Email', with: 'test.com'
    fill_in 'user_password', with: 'secret'
    fill_in 'Password confirmation', with: 'secret'
    within(".form") do
      click_on 'Sign up'
    end
    
    expect(page).to have_content("bad format of an email")
  end
end