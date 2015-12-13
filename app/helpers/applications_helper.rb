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

	def status_color(app)
		if app.status == 'rejected'
			return 'danger'
		elsif app.status == 'approved'
			return "success"
		else 
			return 'default'
		end
	end

	def application_date(app)
		app.created_at.strftime('%d %b %Y at %H:%M')
	end
end
