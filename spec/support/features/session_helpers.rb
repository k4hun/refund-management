module Features
  module SessionHelpers

    def login
      user = FactoryGirl.create(:user)
      visit login_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
    
    def admin_login
      admin = FactoryGirl.create(:admin)
      visit login_path
      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password
      click_button 'Log in'
    end

    def logout
      click_on 'Logout'
    end
  end
end