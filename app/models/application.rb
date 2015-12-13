class Application < ActiveRecord::Base
	after_initialize :set_default_values

	belongs_to :user
	belongs_to :category
	
	validates :user, presence: true
	validates :description, length: { maximum: 500 }
	validates :refund_value, inclusion: { in: 1..100, message: 'Must be between 1 and 100' }

	def approve
		self.status = 'approved'
		self.save
	end

	def reject
		self.status = 'rejected'
		self.save
	end

	def set_default_values
		self.refund_value = 1
	end
end