require 'rails_helper'

RSpec.feature "Admin review application", :type => :feature do
  
  let!(:app) { FactoryGirl.create(:application) }
  let!(:cat) { FactoryGirl.create(:category) }
  before { admin_login }
  
  scenario 'approves with default values' do
    visit applications_path
    expect(page).to have_content 'List of application'
    expect(page).to have_content 'Not yet defined'
    expect(page).to have_content 'Pending'
    click_on 'Review'
    
    expect(page).to have_content 'Review application'
    click_on 'Approve'
    
    expect(page).to have_content 'Application approved'
    expect(page).to have_content cat.name
    expect(page).to have_content 'Approved'
    expect(page).to have_content 'Approved with 10% refund'
  end
  
  scenario 'approves with changed refund value' do
    visit applications_path
    click_on 'Review'
    
    expect(page).to have_content 'Review application' 
    fill_in 'Refund %', with: 33
    click_on 'Approve' 
    
    expect(page).to have_content 'Approved with 33% refund'
  end
  
  scenario 'rejects' do
    visit applications_path
    click_on 'Review'
    
    expect(page).to have_content 'Review application' 
    click_on 'Reject' 
    
    expect(page).to have_content 'Application rejected'
    expect(page).to have_content 'Rejected'
  end
end