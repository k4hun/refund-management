class MonthlyReport < ApplicationMailer
  default from: 'Reports@k4hun.com'
 
  def report
    @approved_from_last_month = Application.approved.from_last_month
    @users_with_approved = User.with_approved_applications
    mail(to: 'thameth@gmail.com', subject: 'Monthly report of approved application')
  end
end
