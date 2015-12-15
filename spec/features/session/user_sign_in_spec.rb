require 'rails_helper'

RSpec.feature "User signs in", :type => :feature do
  
  let(:role) { FactoryGirl.create(:role) }
  let(:user) { FactoryGirl.create(:user) }
  
  scenario 'with valid email and password' do
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'session_password', with: user.password
    within(".form") do
      click_on 'Log in'
    end
    
    expect(page).to have_content('Signed as:')
  end

  scenario 'with blank password' do
    visit login_path
    fill_in 'Email', with: 'test@email.com'
    fill_in 'session_password', with: ''
    within(".form") do
      click_on 'Log in'
    end
    
    expect(page).to have_content("Wrong user name or password!")
  end
  
  scenario 'with blank email' do
    visit login_path
    fill_in 'Email', with: ''
    fill_in 'session_password', with: 'secret'
    within(".form") do
      click_on 'Log in'
    end
    
    expect(page).to have_content("Wrong user name or password!")
  end
end