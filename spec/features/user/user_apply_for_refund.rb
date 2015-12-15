require 'rails_helper'

RSpec.feature "User apply for refund", :type => :feature do
  
  let(:role) { FactoryGirl.create(:role) }
  let(:user) { FactoryGirl.create(:user) }
  
  before { login }
  
  scenario 'with valid description' do
    visit new_application_path
    fill_in 'Description', with: Faker::Lorem.sentence
    click_on 'Apply'
    
    expect(page).to have_content('Refund application has been sent to admin')
    expect(page).to have_content('List of applications')
  end

  scenario 'with blank description' do
    visit new_application_path
    fill_in 'Description', with: ''
    click_on 'Apply'
    
    expect(page).to have_content('Apply for refund')
    expect(page).to have_content('can\'t be blank')
  end
  
  scenario 'with too long description' do
    visit new_application_path
    fill_in 'Description', with: 'x' * 501
    click_on 'Apply'
    expect(page).to have_content('Apply for refund')
    expect(page).to have_content('is too long')
  end
end