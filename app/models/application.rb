class Application < ActiveRecord::Base
	after_initialize :set_default_refund_value

	belongs_to :user
	belongs_to :category
	
	validates :user, :status, presence: true
	validates :description, length: { maximum: 500 }
	validates :refund_value, inclusion: { in: 1..100 }

	def approve
		unless self.status
			self.status = 'approved'
			self.save
		end
	end

	def reject
		unless self.status
			self.status = 'rejected'
			self.save
		end
	end

	def set_default_values
		self.refund_value = 1
		self.status = 'pending'
	end
end