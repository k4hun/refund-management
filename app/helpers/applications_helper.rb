module ApplicationsHelper
	def check_status(app)
		if app.status == 'rejected'
			return 'Rejected'
		elsif app.status == 'approved'
			return "Approved with #{app.refund_value}% refund"
		else 
			return 'Pending'
		end				
	end
end
